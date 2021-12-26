//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/10/21.
//

import Foundation

public class EntityGrantSearchResponse:Codable{

    public var grants:[EntityGrant]?
    public var total:Int64?
    
    public init(grants: [EntityGrant]? = nil, total: Int64? = nil) {
        self.grants = grants
        self.total = total
    }
}
