//
//  MovieDetailSimilarCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.01.2024.
//

public class MovieDetailSimilarCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .clipsToBounds(true)
        .cornerRadius(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .numberOfLines(0)
        .build()
    
    weak var viewModel: MovieDetailSimilarCellProtocol?
    
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
extension MovieDetailSimilarCell {
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .bottom)
        imageView.height(100)
        
        contentView.addSubview(titleLabel)
        titleLabel.topToBottom(of: imageView).constant = 5
        titleLabel.edgesToSuperview(excluding: .top)
    }
}

// MARK: - SetViewModel
extension MovieDetailSimilarCell {
    
    public func set(viewModel: MovieDetailSimilarCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(viewModel.backdropPath)
        titleLabel.text = viewModel.title
    }
}
