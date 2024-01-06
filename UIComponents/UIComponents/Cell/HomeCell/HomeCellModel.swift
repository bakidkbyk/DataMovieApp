//
//  HomeCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.11.2023.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
    var movieId: Int { get }
    var backdropPath: String? { get }
    var title: String? { get }
    var overview: String? { get }
    var date: String? { get }
}

public protocol HomeCellEventSource: AnyObject {}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {}

public final class HomeCellModel: HomeCellProtocol {
    
    public var movieId: Int
    public var backdropPath: String?
    public var title: String?
    public var overview: String?
    public var date: String?
    
    public init(movieId: Int, backdropPath: String?, title: String?, overview: String?, date: String?) {
        self.movieId = movieId
        self.backdropPath = backdropPath
        self.title = title
        self.overview = overview
        self.date = date
    }
}
