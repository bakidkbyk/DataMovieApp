//
//  MovieDetailTrailerCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 29.01.2024.
//

import UIKit

public class MovieDetailTrailerCell: UICollectionViewCell, ReusableView {
    
    private let nameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let typeLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let trailerButton = UIButtonBuilder()
        .cornerRadius(1)
        .backgroundColor(.clear)
        .backgroundImage(.arrowIcon)
        .build()
    
    weak var viewModel: MovieDetailTrailerCellProtocol?
    
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
extension MovieDetailTrailerCell {
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        nameLabel.edgesToSuperview(excluding: [.bottom, .trailing], insets: .init(top: 20, left: 20, bottom: 0, right: 0))
        
        contentView.addSubview(typeLabel)
        typeLabel.centerYToSuperview()
        
        contentView.addSubview(trailerButton)
        trailerButton.edgesToSuperview(excluding: [.leading, .bottom], insets: .init(top: 20, left: 0, bottom: 0, right: 20))
    }
}

// MARK: - SetViewModel
extension MovieDetailTrailerCell {
    
    public func set(viewModel: MovieDetailTrailerCellProtocol) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
    }
}
