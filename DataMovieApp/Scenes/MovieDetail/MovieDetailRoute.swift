//
//  MovieDetailRoute.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 6.01.2024.
//

protocol MovieDetailRoute {
    func pushMovieDetail(movieId: Int)
}

extension MovieDetailRoute where Self: RouterProtocol {
    
    func pushMovieDetail(movieId: Int) {
        let router = MovieDetailRouter()
        let viewModel = MovieDetailViewModel(movieId: movieId, router: router)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
