//
//  HomeMovieHeaderCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import UIKit

public class HomeMovieHeaderCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: HomeMovieHeaderCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: HomeMovieHeaderCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
