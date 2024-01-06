//
//  SearchCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

import Foundation

public protocol SearchCellDataSource: AnyObject {
    var movieId: Int { get }
    var title: String? { get }
    var date: String? { get }
}

public protocol SearchCellEventSource: AnyObject {
    
}

public protocol SearchCellProtocol: SearchCellDataSource, SearchCellEventSource {
    
}

public final class SearchCellModel: SearchCellProtocol {
    
    public var movieId: Int
    public var title: String?
    public var date: String?
    
    public init(movieId: Int, title: String?, date: String?) {
        self.movieId = movieId
        self.title = title
        self.date = date
    }
}
