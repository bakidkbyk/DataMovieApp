//
//  HomeViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 24.10.2023.
//
//
import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private lazy var searchController: UISearchController = {
        let searchRouter = SearchRouter()
        let searchViewModel = SearchViewModel(router: searchRouter)
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        searchRouter.viewController = self
        
        let searchController = UISearchController(searchResultsController: searchViewController)
        return searchController
    }()
    
    private let collectionView = UICollectionViewBuilder()
        .backgroundColor(.clear)
        .scrollDirection(.vertical)
        .showsHorizontalScrollIndicator(false)
        .build()
    
    private let refreshControl = UIRefreshControl()
    
    var searchTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        subscribeViewModel()
        viewModel.getData(showLoading: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}

// MARK: - CongigureContents
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerHeader(HomeMovieHeaderView.self )
        collectionView.register(HomeCell.self)
        collectionView.registerFooter(ActivityIndicatorFooterView.self)
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
}

// MARK: - UIScrollViewDidScroll
extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if contentOffSetY > contentHeight - height && viewModel.isPagingEnabled && !viewModel.isRequestEnabled {
            viewModel.getUpcomingDataMovieRequest()
        }
    }
}

// MARK: Actions
extension HomeViewController {
    @objc
    func handleRefreshControl() {
        if refreshControl.isRefreshing {
            viewModel.resetData()
        }
    }
}

// MARK: - UpdateSearchResults
extension HomeViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchTimer?.invalidate()
        searchTimer = nil
        guard let searchText = searchController.searchBar.text else { return }
        
        if searchText.count > 2 {
            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
                guard let self = self else { return}
                self.viewModel.searchMovieRequest(query: searchText)
                let searchViewController = searchController.searchResultsController as? SearchViewController
                searchViewController?.viewModel.cellItems = self.viewModel.searchMovieItems
                self.viewModel.searchMovieItems.removeAll()
            })
        } else if searchText.isEmpty {
            let searchViewController = searchController.searchResultsController as? SearchViewController
            searchViewController?.viewModel.cellItems.removeAll()
            viewModel.searchMovieItems.removeAll()
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let searchViewController = searchController.searchResultsController as? SearchViewController
        searchViewController?.viewModel.cellItems.removeAll()
        viewModel.searchMovieItems.removeAll()
    }
}

// MARK: SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        viewModel.getDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
        
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectMovie(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView: HomeMovieHeaderView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
            headerView.homeHeaderData = viewModel.homeHeaderMovieCellItems
            headerView.didSelectItemAtClosure = { [weak self] movieId in
                guard let self = self else { return }
                self.viewModel.didSelectHeaderMovie(indexPath: indexPath, movieId: movieId)
            }
            return headerView
        } else if kind == UICollectionView.elementKindSectionFooter {
            let footerView: ActivityIndicatorFooterView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
            return footerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter,
           let view = view as? ActivityIndicatorFooterView,
           viewModel.isPagingEnabled {
            view.startLoading()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplayingSupplementaryView view: UICollectionReusableView,
                        forElementOfKind elementKind: String,
                        at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter,
           let view = view as? ActivityIndicatorFooterView,
           viewModel.isPagingEnabled {
            view.stopLoading()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width
        return CGSize(width: cellWidth, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}
