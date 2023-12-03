//
//  HomeCellModel+Extension.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 13.11.2023.
//

import MobilliumDateFormatter

extension HomeCellModel {
    
    convenience init(dataMovieInfo: DataMovieInfo) {
    
        let date = Date.from(dataMovieInfo.date ?? "", format: .custom(rawValue: "yyyy-MM-dd"))
        let dateToString = date?.to(.custom(rawValue: "dd-MM-yyyy"))
        
        self.init(movieId: dataMovieInfo.movieId,
                  backdropPath: dataMovieInfo.backdropPath,
                  title: dataMovieInfo.title,
                  overview: dataMovieInfo.overview,
                  date: dateToString)
    }
}
