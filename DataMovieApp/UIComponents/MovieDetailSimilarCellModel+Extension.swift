//
//  SimilarMovieCellModel+Extension.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 24.01.2024.
//

public extension MovieDetailSimilarCellModel {
    
    convenience init(similarMovie: DataMovieInfo) {
        let date = Date.from(similarMovie.date ?? "", format: .custom(rawValue: "yyyy-dd-mm"))
        let dateToString = date?.to(.custom(rawValue: "(yyyy)"))
        
        self.init(movieId: similarMovie.movieId,
                  backdropPath: Base.backdropPathBaseURL + (similarMovie.backdropPath ?? ""),
                  title: "\(similarMovie.title ?? "")" + "\(dateToString ?? "")")
        
    }
}
