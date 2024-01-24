//
//  DataMovieDetail.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 10.01.2024.
//

public struct DataMovieDetail: Decodable {

    public let backdropPath: String?
      public let movieRating: Double
      public let date: String?
      public let title: String?
      public let overview: String?
      
      enum CodingKeys: String, CodingKey {
          case backdropPath = "backdrop_path"
          case movieRating = "vote_average"
          case date = "release_date"
          case title
          case overview
      }
}
