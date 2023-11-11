//
//  HomeMovieHeaderCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.10.2023.
//


public protocol HomeMovieHeaderCellDataSource: AnyObject {
    var backdropPath: String? { get }
    var id: Int { get }
    var title: String? { get }
    var overview: String? { get }
}

public protocol HomeMovieHeaderCellEventSource: AnyObject {
    
}

public protocol HomeMovieHeaderCellProtocol: HomeMovieHeaderCellDataSource, HomeMovieHeaderCellEventSource {
    
}

public final class HomeMovieHeaderCellModel: HomeMovieHeaderCellProtocol {
    
    public var backdropPath: String?
    public var id: Int
    public var title: String?
    public var overview: String?
    
    public init(backdropPath: String?, id: Int, title: String?, overview: String?) {
        self.backdropPath = backdropPath
        self.id = id
        self.title = title
        self.overview = overview
    }
}
