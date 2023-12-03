//
//  BaseViewController.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 21.10.2023.
//
//

class BaseViewController<V: BaseViewModeProtocol>: UIViewController, BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    private let tryAgainButton = UIButtonBuilder()
        .titleFont(.font(.nunitoBold, size: .medium))
        .titleColor(.white)
        .build()
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeActivityIndicator()
        subscribeLoading()
        subscribeToast()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    private func addTryAgainButton() {
        view.addSubview(tryAgainButton)
        tryAgainButton.centerInSuperview()
        tryAgainButton.size(CGSize(width: 200, height: 50))
        tryAgainButton.setTitle(L10n.BaseController.tryAgainButtonText, for: .normal)
        tryAgainButton.backgroundColor = .red
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func tryAgainButtonTapped() {
        viewModel.tryAgainButtonTapped()
    }
    
    func subscribeTryAgainButton() {
        viewModel.showTryAgainButton = { [weak self] in
            self?.addTryAgainButton()
        }
    }
    
    func subscribeHideTryAgainButton() {
        viewModel.hideTryAgainButton = { [weak self] in
            self?.tryAgainButton.removeFromSuperview()
        }
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }

        viewModel.showSuccessToast = { text in
            ToastPresenter.showSuccessToast(text: text)
        }
    }

    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
}
