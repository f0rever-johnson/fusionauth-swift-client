//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/20/21.
//

import Foundation

public struct IPAccessControlListSearchCriteria:BaseSearchCriteria{
 
    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var name:String?
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, name: String? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.name = name
    }
}
