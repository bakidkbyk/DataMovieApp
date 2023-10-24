//
//  HomeViewModel.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 24.10.2023.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
}
