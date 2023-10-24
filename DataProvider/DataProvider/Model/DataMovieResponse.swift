//
//  DataMovieResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct DataMovieResponse: Decodable {
    public let page: Int
    public let results: [DataMovieInfo]
    public let totalPage: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPage = "total_pages"
        case totalResults = "total_results"
    }
}
