//
//  UpcomingDataMovieRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 22.10.2023.
//

public struct UpcomingDataMovieRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public let path: String = "movie/upcoming"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(page: Int) {
        self.parameters["api_key"] = Base.apiKey
        self.parameters["page"] = page
    }
}
