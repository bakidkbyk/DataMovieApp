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
        
        titleAndOverviewStackView.edgesToSuperview(excluding: [.trailing, .bottom], insets: .init(top: 30, left: 10, bottom: 0, right: 0))
        
        contentView.addSubview(dateLabel)
        dateLabel.edgesToSuperview(excluding: [.trailing, .top], insets: .init(top: 0, left: 0, bottom: 20, right: 30))
        
        contentView.addSubview(seperatorView)
        seperatorView.bottomToSuperview()
    }
}

// MARK: - Configure Contents
extension HomeCell {
    
    private func configureContents() {
        seperatorView.height(1)
        seperatorView.backgroundColor = .gray
    }
}

// MARK: - SetViewModel
extension HomeCell {
    
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
    }
}
