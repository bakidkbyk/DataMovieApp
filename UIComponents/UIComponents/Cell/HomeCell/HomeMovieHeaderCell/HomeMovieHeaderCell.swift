//
//  HomeMovieHeaderCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit
import Utilities

public class HomeMovieHeaderCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .build()
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .textColor(.white)
        .font(.font(.nunitoExtraBold, size: .xLarge))
        .build()

    private let descriptionLabel = UILabelBuilder()
        .textColor(.white)
        .font(.font(.nunitoBold, size: .medium))
        .numberOfLines(0)
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

// MARK: - UILayout
extension HomeMovieHeaderCell {
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview()
        
        contentView.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 40, right: 20))
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
    }
}

// MARK: - SetViewModel
public extension HomeMovieHeaderCell {
    
    func set(viewModel: HomeMovieHeaderCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(Base.backdropPathBaseURL + (viewModel.backdropPath ?? ""))
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
    }
}
