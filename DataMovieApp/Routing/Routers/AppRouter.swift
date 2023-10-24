//
//  AppRouter.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 19.10.2023.
//

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = HomeRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        placeOnWindowHome()
    }
}
