//
//  MovieDetailTrailerView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 29.01.2024.
//

import UIKit

public class MovieDetailTrailerView: UIView {
    
    private let collectionView = UICollectionViewBuilder()
        .backgroundColor(.clear)
        .scrollDirection(.horizontal)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieDetailTrailerCell.self)
    }
    
    public var movieTrailerData: [MovieDetailTrailerCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
}

// MARK: UILayout
extension MovieDetailTrailerView {
    
    private func addSubviews() {
        addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - UICollectinViewDelegate
extension MovieDetailTrailerView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension MovieDetailTrailerView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTrailerData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieDetailTrailerCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = movieTrailerData[indexPath.row]
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MovieDetailTrailerView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
