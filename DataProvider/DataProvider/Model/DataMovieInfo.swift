//
//  DataMovieInfo.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 21.10.2023.
//

public struct DataMovieInfo: Codable {
    public let id: Int
    public let title: String?
    public let overView: String?
    public let date: String?
    public let backdropPath: String?
}
