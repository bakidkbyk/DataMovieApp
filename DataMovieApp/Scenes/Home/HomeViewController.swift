//
//  HomeViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 24.10.2023.
//
//
import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let refreshControl = UIRefreshControl()
    
    private let collectionView = UICollectionViewBuilder()
        .backgroundColor(.clear)
        .scrollDirection(.vertical)
        .showsHorizontalScrollIndicator(false)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        viewModel.getData(showLoading: true)
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubviews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}

// MARK: - Congigure Contents
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerHeader(HomeMovieHeaderView.self )
        collectionView.register(HomeCell.self)
        collectionView.registerFooter(ActivityIndicatorFooterView.self)
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
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

// MARK: Subscribe View Model
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

// MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegate {}

// MARK: - UICollectionView DataSource
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView: HomeMovieHeaderView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
            headerView.homeHeaderData = viewModel.homeHeaderMovieCellItems
            viewModel.didSelectHeaderMovie(indexPath: indexPath)
            return headerView
        } else if kind == UICollectionView.elementKindSectionFooter {
            let footerView: ActivityIndicatorFooterView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
            return footerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

// MARK: - UICollectionView DelegateFlowLayout
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
}
