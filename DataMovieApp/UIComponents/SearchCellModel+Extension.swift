//
//  SearchCellModel+Extension.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 12.12.2023.
//

extension SearchCellModel {
    
    convenience init(dataMovieInfo: DataMovieInfo) {
        let date = Date.from(dataMovieInfo.date ?? "", format: .custom(rawValue: "yyyy-dd-mm"))
        let dateToString = date?.to(.custom(rawValue: "yyyy"))
        
        self.init(movieId: dataMovieInfo.movieId, title: dataMovieInfo.title, date: dateToString)
    }
}
