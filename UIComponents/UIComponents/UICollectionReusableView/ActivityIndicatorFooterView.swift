//
//  ActivityIndicatorFooterView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.11.2023.
//

public class ActivityIndicatorFooterView: UICollectionReusableView, ReusableView {
    
    private let activityIndicatorView = ActivityIndicatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
}

// MARK: - UILayout
extension ActivityIndicatorFooterView {
    
    private func addSubviews() {
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
    }
}

// MARK: - Actions
public extension ActivityIndicatorFooterView {
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
}
