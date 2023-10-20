//
//  ActivityIndicatorView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        style = .gray
        tintColor = .gray
        hidesWhenStopped = true
    }
}
