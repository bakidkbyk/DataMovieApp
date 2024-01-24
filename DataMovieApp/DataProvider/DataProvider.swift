//
//  DataProvider.swift
//  DataMovieApp
//
//  Created by Baki Dikbıyık on 19.10.2023.
//

let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared, eventMonitors: [APILogger()])
