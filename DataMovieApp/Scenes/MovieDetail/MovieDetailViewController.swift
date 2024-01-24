//
//  MovieDetailViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 6.01.2024.
//

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    
    private let headerImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .build()
    
    private let imdpAndRatingView = UIViewBuilder()
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
        .build()
    
    private let titleAndDescriptionStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    
    private let movieTitleLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .build()

    private let descriptionLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .numberOfLines(0)
        .build()
    
    private let testView = UIViewBuilder()
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        subscribeViewModel()
        setData()
        viewModel.getDetail()
    }
}

// MARK: - UILayout
extension MovieDetailViewController {
    
    private func addSubviews() {
        addHeaderImageView()
        addScrollView()
        addContentStackView()
    }
    
    private func addHeaderImageView() {
        view.addSubview(headerImageView)
        headerImageView.edgesToSuperview(excluding: .bottom, usingSafeArea: false)
        headerImageView.aspectRatio(1)
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.topToBottom(of: headerImageView)
        scrollView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 0, bottom: 0, right: 0), usingSafeArea: true)
    
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(imdpAndRatingView)
        
        imdpAndRatingView.addSubview(imdpAndRatingStackView)
        imdpAndRatingStackView.edgesToSuperview(excluding: .right)
        
        imdpAndRatingStackView.addArrangedSubview(imdpImageView)
        imdpImageView.size(.init(width: 30, height: 30))
        
        imdpAndRatingStackView.addArrangedSubview(rateImageView)
        rateImageView.size(.init(width: 25, height: 25))
        
        imdpAndRatingStackView.addArrangedSubview(ratingLabel)
        imdpAndRatingStackView.setCustomSpacing(0, after: ratingLabel)
        
        imdpAndRatingStackView.addArrangedSubview(topRatingLabel)
        
        imdpAndRatingStackView.addArrangedSubview(dateLabel)
        imdpAndRatingStackView.setCustomSpacing(10, after: dateLabel)
        
        contentStackView.addArrangedSubview(titleAndDescriptionStackView)
        
        titleAndDescriptionStackView.addArrangedSubview(movieTitleLabel)
        titleAndDescriptionStackView.addArrangedSubview(descriptionLabel)

    }
}

// MARK: - ConfigureAndLocalize
extension MovieDetailViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        navigationItem.title = viewModel.title
    }
    
    private func setData() {
        headerImageView.setImage(viewModel.backdropPath)
        ratingLabel.text = viewModel.movieRating
        dateLabel.text = viewModel.date
        movieTitleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
    }
}

// MARK: - SubscribeViewModel
extension MovieDetailViewController {
    
    private func subscribeViewModel() {
        viewModel.isGetDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.setData()
        }
    }
}
