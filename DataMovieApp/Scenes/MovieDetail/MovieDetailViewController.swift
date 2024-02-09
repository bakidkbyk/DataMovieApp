//
//  MovieDetailViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 6.01.2024.
//

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let headerImageView = UIImageViewBuilder()
        .contentMode(.scaleToFill)
        .build()
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
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
        .spacing(5)
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
    
    private let trailerTitleLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .textColor(.black)
        .build()
    
    private let movieDetailTrailerView = MovieDetailTrailerView()
    
    private let similarStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()
    
    private let similarTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textColor(.black)
        .build()
    
    private let similarCollectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .build()
    
    private let backButton = UIButtonBuilder()
        .backgroundImage(.backArrowIcon)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setlocalize()
        subscribeViewModel()
        viewModel.getDetail()
        viewModel.getSimilar()
        viewModel.getTrailerVides()
    }
}

// MARK: - UILayout
extension MovieDetailViewController {
    
    private func addSubviews() {
        addHeaderImageView()
        addScrollView()
        addContentStackView()
        addSimilarStackView()
    }
    
    private func addHeaderImageView() {
        view.addSubview(headerImageView)
        headerImageView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        headerImageView.aspectRatio(1.2)
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.topToBottom(of: headerImageView)
        scrollView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 0, bottom: 0, right: 0), usingSafeArea: true)
    
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 10, left: 20, bottom: 0, right: 20))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(imdpAndRatingView)
        contentStackView.setCustomSpacing(10, after: imdpAndRatingView)

        imdpAndRatingView.addSubview(imdpAndRatingStackView)
        imdpAndRatingStackView.edgesToSuperview(excluding: .right)
        
        imdpAndRatingStackView.addArrangedSubview(imdpImageView)
        imdpImageView.size(.init(width: 45, height: 25))
        
        imdpAndRatingStackView.addArrangedSubview(rateImageView)
        rateImageView.size(.init(width: 15, height: 15))
        
        imdpAndRatingStackView.addArrangedSubview(ratingLabel)
        imdpAndRatingStackView.setCustomSpacing(0, after: ratingLabel)
        
        imdpAndRatingStackView.addArrangedSubview(topRatingLabel)
        
        imdpAndRatingStackView.addArrangedSubview(dateLabel)
        imdpAndRatingStackView.setCustomSpacing(10, after: dateLabel)
        
        contentStackView.addArrangedSubview(titleAndDescriptionStackView)
        
        titleAndDescriptionStackView.addArrangedSubview(movieTitleLabel)
        titleAndDescriptionStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func addSimilarStackView() {
        view.addSubview(similarStackView)
        similarStackView.topToBottom(of: scrollView).constant = 20
        similarStackView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 20, bottom: 0, right: 20), usingSafeArea: true)
        similarStackView.addArrangedSubview(similarTitleLabel)
        similarStackView.addArrangedSubview(similarCollectionView)
    }
}

// MARK: - ConfigureAndLocalize
extension MovieDetailViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        similarCollectionView.height(150)
        similarCollectionView.register(MovieDetailSimilarCell.self)
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        movieDetailTrailerView.height(50)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setlocalize() {
        topRatingLabel.text = L10n.MovieDetailController.topTitleRating
        similarTitleLabel.text = L10n.MovieDetailController.similarTitle
        trailerTitleLabel.text = L10n.MovieDetailController.trailersVideosTitle
    }
    
    private func setData() {
        navigationItem.title = viewModel.title
        headerImageView.setImage(viewModel.backdropPath)
        ratingLabel.text = viewModel.movieRating
        dateLabel.text = viewModel.date
        movieTitleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.overview
    }
}

// MARK: - Actions
extension MovieDetailViewController {
    
    @objc
    func backButtonTapped() {
        self.viewModel.showHomeScreen()
    }
}

// MARK: - SubscribeViewModel
extension MovieDetailViewController {
    
    private func subscribeViewModel() {
        viewModel.isGetDataDidSuccess = { [weak self] in
            guard let self = self else { return }
            self.setData()
            self.similarCollectionView.reloadData()
            self.movieDetailTrailerView.movieTrailerData = self.viewModel.movieTrailerCellItems
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MovieDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectSimilarDetail(indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDataSource
extension MovieDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieDetailSimilarCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MovieDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
