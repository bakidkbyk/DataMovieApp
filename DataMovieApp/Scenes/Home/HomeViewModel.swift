//
//  HomeViewModel.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

protocol HomeViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> HomeCellProtocol
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var page = 1
    var isRequestEnabled = false
    var isPagingEnabled = false
    
    private var isGetNowPlayingMovieSuccess = false
    private var isGetUpcomingMovieSuccess = false
    
    private let dispatchGroup = DispatchGroup()
    
    var reloadData: VoidClosure?
    var endRefreshing: VoidClosure?
    var getDataDidSuccess: VoidClosure?
    
    var homecellItems: [HomeCellProtocol] = []
    var homeHeaderMovieCellItems: [HomeMovieHeaderCellProtocol] = []
    var searchMovieItems: [SearchCellModelProtocol] = []
    
    func numberOfItemsAt() -> Int {
        return homecellItems.count
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> HomeCellProtocol {
        return homecellItems[indexPath.row]
    }
    
    override func tryAgainButtonTapped() {
        self.hideTryAgainButton?()
        getData(showLoading: true)
    }
    
    func resetData() {
        homecellItems.removeAll()
        homeHeaderMovieCellItems.removeAll()
        page = 1
        isGetNowPlayingMovieSuccess = false
        isGetUpcomingMovieSuccess = false
        getData(showLoading: false)
    }
}

// MARK: - Actions
extension HomeViewModel {
    
    func didSelectMovie(indexPath: IndexPath) {
        let movieId = homecellItems[indexPath.row].movieId
        router.pushMovieDetail(movieId: movieId)
    }
    
    func didSelectHeaderMovie(indexPath: IndexPath, movieId: Int) {
        router.pushMovieDetail(movieId: movieId)
    }
}

// MARK: - Network
extension HomeViewModel {
     
    func nowPlayingDataMovieRequest() {
        let request = NowPlayingDataMovieRequest()
        dispatchGroup.enter()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let homeHeaderCellItems = response.results.map({ HomeMovieHeaderCellModel(dataMovieInfo: $0) })
                self.homeHeaderMovieCellItems.append(contentsOf: homeHeaderCellItems)
                self.reloadData?()
                self.isGetNowPlayingMovieSuccess = true
            case .failure(let error):
                self.showSuccessToast?(error.localizedDescription)
            }
            self.dispatchGroup.leave()
        }
    }
    
    func getUpcomingDataMovieRequest() {
        let request = UpcomingDataMovieRequest(page: page)
        dispatchGroup.enter()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.results.map({ HomeCellModel(dataMovieInfo: $0) })
                self.homecellItems.append(contentsOf: cellItems)
                self.reloadData?()
                self.page += 1
                self.isGetUpcomingMovieSuccess = true
                self.isPagingEnabled = response.totalPage > response.page
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
            self.isRequestEnabled = false
            self.dispatchGroup.leave()
        }
    }
    
    func searchMovieRequest(query: String) {
        let request = SearchMovieRequest(query: query)
        self.showActivityIndicatorView?()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            switch result {
            case .success(let response):
                self.searchMovieItems = response.results.map({ SearchCellModel(dataMovieInfo: $0) })
            case.failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}

// MARK: - Dispatch Group
extension HomeViewModel {
    
    func getData(showLoading: Bool) {
        
        if showLoading && (!isGetUpcomingMovieSuccess || !isGetNowPlayingMovieSuccess ) {
            self.endRefreshing?()
            showActivityIndicatorView?()
        }
        
        if !isGetNowPlayingMovieSuccess {
            nowPlayingDataMovieRequest()
        }
        
        if !isGetUpcomingMovieSuccess {
            getUpcomingDataMovieRequest()
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            if self.isGetUpcomingMovieSuccess && self.isGetNowPlayingMovieSuccess {
                self.getDataDidSuccess?()
            } else {
                self.showTryAgainButton?()
            }
        }
    }
}
