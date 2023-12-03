//
//  HomeCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.11.2023.
//
 
public class HomeCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .cornerRadius(10)
        .clipsToBounds(true)
        .build()
    
    private let directionImage = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    
    private let titleAndOverviewStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.black)
        .build()
    
    private let overViewLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .numberOfLines(2)
        .textColor(.gray)
        .build()
    
    private let dateLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.gray)
        .build()
    
    private let seperatorView = UIViewBuilder()
        .build()
        
    weak var viewModel: HomeCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        configureContents()
    }
}

// MARK: - UILayout
extension HomeCell {
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .trailing, insets: .init(top: 20, left: 20, bottom: 20, right: 0))
        
        contentView.addSubview(titleAndOverviewStackView)
        titleAndOverviewStackView.addArrangedSubview(titleLabel)
        titleAndOverviewStackView.addArrangedSubview(overViewLabel)
        
        titleAndOverviewStackView.leadingToTrailing(of: imageView).constant = 30
        titleAndOverviewStackView.edgesToSuperview(excluding: [.left, .bottom], insets: .top(30) + .right(30))
        
        contentView.addSubview(dateLabel)
        dateLabel.edgesToSuperview(excluding: [.left, .top], insets: .init(top: 0, left: 0, bottom: 20, right: 30))
        
        contentView.addSubview(directionImage)
        directionImage.leadingToTrailing(of: dateLabel).constant = 10
        directionImage.trailingToSuperview().constant = -5
        directionImage.centerYToSuperview()

        contentView.addSubview(seperatorView)
        seperatorView.bottomToSuperview()
        seperatorView.edgesToSuperview(excluding: [.top, .bottom])
    }
}

// MARK: - Configure Contents
extension HomeCell {
    
    private func configureContents() {
        imageView.width(100)
        directionImage.size(.init(width: 10, height: 10))
        directionImage.image = .arrowIcon
        seperatorView.height(1)
        seperatorView.backgroundColor = .gray
    }
}

// MARK: - SetViewModel
public extension HomeCell {
    
    func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(Base.backdropPathBaseURL + (viewModel.backdropPath ?? ""))
        titleLabel.text = viewModel.title
        overViewLabel.text = viewModel.overview
        dateLabel.text = viewModel.date
    }
}
