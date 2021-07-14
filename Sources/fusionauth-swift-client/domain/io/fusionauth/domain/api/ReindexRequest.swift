//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct ReindexRequest:Codable{

    public var index:String? = nil
    
    public init(index: String? = nil) {
        self.index = index
    }
}
