//
//  HomeMovieHeaderView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit

class HomeMovieHeaderView: UICollectionReusableView, ReusableView {

    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.clear)
        .build()
    
    private let pageContol = UIPageControlBuilder<PageControl>()
        .build()
    
    public var homeHeaderData: [HomeMovieHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
            pageContol.numberOfPages = homeHeaderData.count
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
}

// MARK: - UILayout
extension HomeMovieHeaderView {
    
    func addSubviews() {
        addSubview(collectionView)
        collectionView.edgesToSuperview()
        
        addSubview(pageContol)
        pageContol.centerXToSuperview()
        pageContol.bottomToSuperview()
    }
}

// MARK: - Configure Contents
extension HomeMovieHeaderView {
    
    private func configureContents() {
        collectionView.register(HomeMovieHeaderCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionView Delegate
extension HomeMovieHeaderView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionView DataSource
extension HomeMovieHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeHeaderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeMovieHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = homeHeaderData[indexPath.row]
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeMovieHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionCellHeight = collectionView.frame.height
        let collectionViewWidth = collectionView.frame.width
        
        return CGSize(width: collectionViewWidth, height: collectionCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
