//
//  MovieDetailView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 6.01.2024.
//

import UIKit

public class MovieDetailView: UIView {
    
    private let headerImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .build()
    
    private let imdpAndRatingStackView = UIStackViewBuilder()
        .spacing(10)
        .axis(.horizontal)
        .alignment(.center)
        .build()
    
    private let imdpImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .image(.imdbLogo)
        .build()
    
    private let rateImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .image(.rateIcon)
        .build()
    
    private let ratingLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let topRatingLabel = UILabelBuilder()
        .textColor(.gray)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let dateLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
    
    private let movieTitleLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .build()

    private let descriptionLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
}

// MARK: UILayout
extension MovieDetailView {
    
    private func addSubviews() {

    }
}
