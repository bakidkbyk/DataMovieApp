//
//  PageControl.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit

public class PageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        tintColor = .white
        pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.3)
        currentPageIndicatorTintColor = .white
    }
}
