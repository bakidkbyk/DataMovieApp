//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
