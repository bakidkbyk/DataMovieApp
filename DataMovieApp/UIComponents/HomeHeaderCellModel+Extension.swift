//
//  HomeHeaderCellModel+Extension.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 13.11.2023.
//

extension HomeMovieHeaderCellModel {
    
    convenience init(dataMovieInfo: DataMovieInfo) {
        self.init(backdropPath: dataMovieInfo.backdropPath, id: dataMovieInfo.movieId, title: dataMovieInfo.title, overview: dataMovieInfo.overView)
    }
}
