//
//  MovieDetailTrailerCellModel+Extension.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 30.01.2024.
//

public extension MovieDetailTrailerCellModel {

    convenience init(trailerResponse: DataMovieDetailsVideosResult) {
        self.init(name: trailerResponse.name, type: trailerResponse.type, key: trailerResponse.key)
    }
}
