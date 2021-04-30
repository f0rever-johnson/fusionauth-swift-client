//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation


public class EntityTypeSearchCriteria: BaseSearchCriteria {
    
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var name:String? = nil
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, name: String? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.name = name
    }
    
}
