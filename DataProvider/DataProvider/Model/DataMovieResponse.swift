//
//  DataMovieResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct DataMovieResponse: Codable {
    public let page: Int
    public let results: [DataMovieInfo]
    public let totalPages: Int
    public let totalResults: Int
}
