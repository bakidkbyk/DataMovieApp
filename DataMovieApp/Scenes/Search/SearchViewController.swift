//
//  SearchViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 9.12.2023.
//

import UIKit

final class SearchViewController: BaseViewController<SearchViewModel> {
    
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.vertical)
        .backgroundColor(.white)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        subscribeViewModel()
        view.backgroundColor = .white
    }
}

// MARK: - UILayout
extension SearchViewController {
    
    private func addSubviews() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}

// MARK: - ConfigureContents
extension SearchViewController {
    
    private func configureContents() {
        collectionView.register(SearchCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - SubscribeViewModel
extension SearchViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - CollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate { }

// MARK: - CollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItems[indexPath.row]
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellItems.count
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
