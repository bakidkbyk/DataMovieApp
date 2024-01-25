//
//  SimilarMoviesRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 24.01.2024.
//

public struct SimilarMoviesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public var path: String = ""
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(movieId: Int) {
        self.parameters["api_key"] = Base.apiKey
        self.path = "movie/\(movieId)/similar"
    }
}
