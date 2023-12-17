//
//  SearchCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

import UIKit

public class SearchCell: UICollectionViewCell, ReusableView {
    
    private let searhImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .image(.searchIcon)
        .build()
    
    private let searchStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let dateLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.gray)
        .build()
    
    weak var viewModel: SearchCellProtocol?
    
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
extension SearchCell {
    
    private func addSubviews() {
        contentView.addSubview(searhImageView)
        searhImageView.leadingToSuperview().constant = 10
        searhImageView.centerYToSuperview()
        searhImageView.size(.init(width: 20, height: 20))
        
        contentView.addSubview(searchStackView)
        searchStackView.leadingToTrailing(of: searhImageView).constant = -10
        searchStackView.trailingToSuperview().constant = -10
        searchStackView.centerYToSuperview()
        
        searchStackView.addArrangedSubview(titleLabel)
        searchStackView.addArrangedSubview(dateLabel)
        
    }
}

// MARK: - SetViewModel
extension SearchCell {
    
    public func set(viewModel: SearchCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
    }
}
