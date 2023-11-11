//
//  HomeCellModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 11.11.2023.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
    
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
    
}
