//
//  MovieDetailsSimilarCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.01.2024.
//

import Foundation

public protocol MovieDetailSimilarCellDataSource: AnyObject {
    var movieId: Int { get }
    var backdropPath: String? { get }
    var title: String? { get }
}

public protocol MovieDetailSimilarCellEventSource: AnyObject {}

public protocol MovieDetailSimilarCellProtocol: MovieDetailSimilarCellDataSource, MovieDetailSimilarCellEventSource {}

public final class MovieDetailSimilarCellModel: MovieDetailSimilarCellProtocol {
    public var movieId: Int
    public var backdropPath: String?
    public var title: String?
    
    public init(movieId: Int, backdropPath: String?, title: String?) {
        self.movieId = movieId
        self.backdropPath = backdropPath
        self.title = title
    }
}
