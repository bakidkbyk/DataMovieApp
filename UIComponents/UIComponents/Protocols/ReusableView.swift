//
//  ReusableView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 26.10.2023.
//

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
