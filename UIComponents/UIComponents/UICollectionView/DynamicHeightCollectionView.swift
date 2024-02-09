//
//  DynamicHeightCollectionView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 2.02.2024.
//

public final class DynamicHeightCollectionView: UICollectionView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
