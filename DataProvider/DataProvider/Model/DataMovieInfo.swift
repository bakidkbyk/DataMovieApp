//
//  DataMovieInfo.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct DataMovieInfo: Decodable {
    public let movieId: Int
    public let title: String?
    public let overview: String?
    public let date: String?
    public let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case title
        case overview
        case date = "release_date"
        case backdropPath = "backdrop_path"
    }
}
