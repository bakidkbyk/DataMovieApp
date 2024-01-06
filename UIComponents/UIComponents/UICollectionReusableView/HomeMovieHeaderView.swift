//
//  HomeMovieHeaderView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit

public class HomeMovieHeaderView: UICollectionReusableView, ReusableView {

    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .showsHorizontalScrollIndicator(false)
        .isPagingEnabled(true)
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
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        configureContents()
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

// MARK: - ConfigureContents
extension HomeMovieHeaderView {
    
    private func configureContents() {
        collectionView.register(HomeMovieHeaderCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UIScrollViewDidScroll
extension HomeMovieHeaderView {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.frame.width
        let currentPage = Int(contentOffsetX / contentWidth)
        pageContol.currentPage = currentPage
    }
}

// MARK: - UICollectionViewDelegate
extension HomeMovieHeaderView: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension HomeMovieHeaderView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeHeaderData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeMovieHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = homeHeaderData[indexPath.row]
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeMovieHeaderView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionCellHeight = collectionView.frame.height
        let collectionViewWidth = collectionView.frame.width
        
        return CGSize(width: collectionViewWidth, height: collectionCellHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
