//
//  SearchMovieRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

public struct SearchMovieRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public var path: String = "search/movie"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(query: String) {
        self.parameters["query"] = query
        self.parameters["api_key"] = Base.apiKey
    }
}
