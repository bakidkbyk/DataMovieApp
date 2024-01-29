//
//  MovieDetailViewModel.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 6.01.2024.
//

protocol MovieDetailViewDataSource {
    var backdropPath: String? { get }
    var movieRating: String? { get }
    var date: String? { get }
    var title: String? { get }
    var overview: String? { get }
    var rateRating: Double? { get }
    
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> MovieDetailSimilarCellProtocol
}

protocol MovieDetailViewEventSource {}

protocol MovieDetailViewProtocol: MovieDetailViewDataSource, MovieDetailViewEventSource {}

final class MovieDetailViewModel: BaseViewModel<MovieDetailRouter>, MovieDetailViewProtocol {
    
    func numberOfItemsAt() -> Int {
        return cellItems.count
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> MovieDetailSimilarCellProtocol {
        return cellItems[indexPath.row]
    }
    
    var cellItems = [MovieDetailSimilarCellProtocol]()
    var movieTrailerCellItems = [MovieDetailTrailerCellProtocol]()
    
    var backdropPath: String?
    var movieRating: String?
    var date: String?
    var title: String?
    var overview: String?
    var rateRating: Double?
    
    var isGetDataDidSuccess: VoidClosure?
    
    var movieId: Int
    
    init(movieId: Int, router: MovieDetailRouter) {
        self.movieId = movieId
        super.init(router: router)
    }
}

// MARK: Network
extension MovieDetailViewModel {
    
    func getDetail() {
        let request = MovieDetailRequest(movieId: movieId)
        self.showActivityIndicatorView?()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            switch result {
            case .success(let response):
                self.setItem(dataMovieInfo: response)
                self.isGetDataDidSuccess?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func getSimilar() {
        let request = SimilarMoviesRequest(movieId: movieId)
        self.showActivityIndicatorView?()
        dataProvider.request(for: request) { [weak self] result in
            self?.hideActivityIndicatorView?()
            switch result {
            case .success(let response):
                let cellItems = response.results.map( {MovieDetailSimilarCellModel(similarMovie: $0) })
                self?.cellItems.append(contentsOf: cellItems)
                self?.isGetDataDidSuccess?()
            case .failure(let error):
                self?.showWarningToast?(error.localizedDescription)
            }
        }
    }
    
    func setItem(dataMovieInfo: DataMovieDetail) {
        let apiDate = Date.from(dataMovieInfo.date ?? "", format: .custom(rawValue: "yyyy-dd-mm"))
        let dateToString = apiDate?.to(.custom(rawValue: "yyyy"))
        
        backdropPath = Base.backdropPathBaseURL + (dataMovieInfo.backdropPath ?? "")
        movieRating = String(format: "%.1f", dataMovieInfo.movieRating)
        date = apiDate?.to(.custom(rawValue: "dd.mm.yyyy"))
        title = "\(dataMovieInfo.title ?? "") \(dateToString ?? "")"
        overview = dataMovieInfo.overview
        rateRating = dataMovieInfo.movieRating
    }
}

// MARK: Actions
extension MovieDetailViewModel {
    
    func didSelectSimilarDetail(indexPath: IndexPath) {
        let movieId = cellItems[indexPath.row].movieId
        router.pushMovieDetail(movieId: movieId)
    }
}
