//
//  DismissableRoute.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 19.10.2023.
//

import UIKit

protocol DismissableRoute {
    func dismiss(isAnimated: Bool, completion: VoidClosure?)
}

extension DismissableRoute where Self: RouterProtocol {
    func dismiss(isAnimated: Bool = true, completion: VoidClosure? = nil) {
        guard let viewController = self.viewController else {
            assertionFailure("Nothing to close.")
            return
        }
        viewController.dismiss(animated: isAnimated, completion: completion)
    }
}
