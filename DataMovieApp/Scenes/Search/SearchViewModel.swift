//
//  SearchViewModel.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 9.12.2023.
//


protocol SearchViewDataSource {}

protocol SearchViewEventSource {}

protocol SearchViewProtocol: SearchViewDataSource, SearchViewEventSource {}

final class SearchViewModel: BaseViewModel<SearchRouter>, SearchViewProtocol {
    
    var reloadData: VoidClosure?
    
    public var cellItems: [SearchCellModelProtocol] = [] {
        didSet {
            self.reloadData?()
        }
    }
}
