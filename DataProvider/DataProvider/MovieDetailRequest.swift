//
//  MovieDetailRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 7.01.2024.
//

public struct MovieDetailRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieDetail
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(movieId: Int) {
        self.parameters["api_key"] = Base.apiKey
        self.path = "movie/\(movieId)"
    }
}
