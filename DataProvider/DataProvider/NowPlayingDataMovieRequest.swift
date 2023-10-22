//
//  NowPlayingDataMovieRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct NowPlayingDataMovieRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public var path: String = ""
    public var method: RequestMethod = <#T##Type###>
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
