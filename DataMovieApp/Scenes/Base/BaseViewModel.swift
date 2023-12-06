//
//  BaseViewModel.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showWarningToast: StringClosure? { get set }
    var showSuccessToast: StringClosure? { get set }
    
    var showTryAgainButton: VoidClosure? { get set }
    var hideTryAgainButton: VoidClosure? { get set }
}

protocol BaseViewModeProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func tryAgainButtonTapped()
}

class BaseViewModel<R: Router>: BaseViewModeProtocol {
    
    func tryAgainButtonTapped() {}
    
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showWarningToast: StringClosure?
    var showSuccessToast: StringClosure?
    
    var showTryAgainButton: VoidClosure?
    var hideTryAgainButton: VoidClosure?
    
    let router: R
    let dataProvider: DataProviderProtocol
    
    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
}
