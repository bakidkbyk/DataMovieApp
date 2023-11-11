//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .red, dark: .red))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
    
    public static func showSuccessToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .green, dark: .green))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
