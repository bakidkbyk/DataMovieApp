//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
