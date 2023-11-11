//
//  NowPlayingDataMovieRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct NowPlayingDataMovieRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public let path: String = "movie/now_playing"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {
        self.parameters["api_key"] = Base.apiKey
    }
}
