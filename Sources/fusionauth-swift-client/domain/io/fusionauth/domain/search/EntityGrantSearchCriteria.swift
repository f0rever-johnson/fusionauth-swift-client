//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/10/21.
//

import Foundation

public class EntityGrantSearchCriteria:BaseSearchCriteria{
    
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var entityId:UUID? = nil
    public var name:String? = nil
    public var userId:UUID? = nil
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, entityId: UUID? = nil, name: String? = nil, userId: UUID? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.entityId = entityId
        self.name = name
        self.userId = userId
    }
    
    
}
