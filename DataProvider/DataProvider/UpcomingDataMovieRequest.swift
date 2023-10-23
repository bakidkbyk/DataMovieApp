//
//  UpcomingDataMovieRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 22.10.2023.
//

public struct UpcomingDataMovieRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DataMovieResponse
    
    public let path: String = "upcoming"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(page: Int) {
        self.parameters["api_key"] = "c769702d7265a55746233428c8f77e7a"
        self.parameters["page"] = page
    }
}
