//
//  ActivityIndicatorProtocol.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public protocol ActivityIndicatorProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()

}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    
    func showActivityIndicator() {
        let indicator = ActivityIndicatorView(frame: .infinite)
        indicator.startAnimating()
        view.addSubview(indicator)
        view.bringSubviewToFront(indicator)
        indicator.centerInSuperview()
        
    }
    
    func hideActivityIndicator() {
        view.subviews.filter({ $0 is ActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
}
