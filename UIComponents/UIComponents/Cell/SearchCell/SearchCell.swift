//
//  SearchCell.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

import UIKit

public class SearchCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: SearchCellProtocol?
    
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
    
    public func set(viewModel: SearchCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
