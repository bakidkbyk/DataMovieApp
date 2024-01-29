//
//  MovieDetailTrailerCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 29.01.2024.
//

import Foundation

public protocol MovieDetailTrailerCellDataSource: AnyObject {
    var name: String? { get }
    var type: String? { get }
}

public protocol MovieDetailTrailerCellEventSource: AnyObject {
    
}

public protocol MovieDetailTrailerCellProtocol: MovieDetailTrailerCellDataSource, MovieDetailTrailerCellEventSource {
    
}

public final class MovieDetailTrailerCellModel: MovieDetailTrailerCellProtocol {
    
    public var name: String?
    public var type: String?
    
    init(name: String?, type: String?) {
        self.name = name
        self.type = type
    }
}
