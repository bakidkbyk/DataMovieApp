//
//  Animator.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 19.10.2023.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
