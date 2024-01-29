//
//  DataMovieDetailVideosResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 29.01.2024.
//

public struct DataMovieDetailVideosResponse: Decodable {
    
    public let id: Int
    public let results: [DataMovieDetailsVideosResult]
}
