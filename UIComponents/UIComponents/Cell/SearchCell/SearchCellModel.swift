//
//  SearchCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

public protocol SearchCellModelDataSource: AnyObject {
    var movieId: Int { get }
    var title: String? { get }
    var date: String? { get }
}

public protocol SearchCellModelEventSource: AnyObject {
    
}

public protocol SearchCellModelProtocol: SearchCellModelDataSource, SearchCellModelEventSource {
    
}

public final class SearchCellModel: SearchCellModelProtocol {
    
    public var movieId: Int
    public var title: String?
    public var date: String?
    
    public init(movieId: Int, title: String?, date: String?) {
        self.movieId = movieId
        self.title = title
        self.date = date
    }
}
