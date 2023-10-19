//
//  Transition.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 19.10.2023.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
