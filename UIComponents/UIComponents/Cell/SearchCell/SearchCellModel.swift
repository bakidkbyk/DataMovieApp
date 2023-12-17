//
//  SearchCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.12.2023.
//

import Foundation

public protocol SearchCellDataSource: AnyObject {
    
}

public protocol SearchCellEventSource: AnyObject {
    
}

public protocol SearchCellProtocol: SearchCellDataSource, SearchCellEventSource {
    
}

public final class SearchCellModel: SearchCellProtocol {
    
}
