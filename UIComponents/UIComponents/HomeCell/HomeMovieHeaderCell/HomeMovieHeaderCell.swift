//
//  HomeMovieHeaderCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit

public class HomeMovieHeaderCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .textColor(.white)
        .font(.font(.nunitoBold, size: .xLarge))
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .medium))
        .build()
    
    weak var viewModel: HomeMovieHeaderCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
}

// MARK: - UILauyout
extension HomeMovieHeaderCell {
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview()
        
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(excluding: [.bottom, .trailing], insets: .init(top: 200, left: 20, bottom: 0, right: 0))
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: titleLabel).constant = 20
        descriptionLabel.leadingToSuperview().constant = 20
        descriptionLabel.trailingToSuperview().constant = -20
        
    }
}

// MARK: - Set View Model
extension HomeMovieHeaderCell {
    
    public func set(viewModel: HomeMovieHeaderCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(viewModel.backdropPath ?? "")
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
    }
    
}
