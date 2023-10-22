//
//  DataMovieAppRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public protocol DataMovieAppRequest: DecodableResponseRequest { }

// MARK: - Default Values
public extension DataMovieAppRequest {
    
    var parameters: RequestParameters {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        case .connect, .delete, .head, .options, .patch, .post, .put, .trace:
            return .json
        }
    }
    
    var url: String {
        return "https://api.themoviedb.org/3/movie/" + path
    }

}
