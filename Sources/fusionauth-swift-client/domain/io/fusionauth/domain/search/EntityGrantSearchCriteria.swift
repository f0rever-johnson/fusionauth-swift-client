//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/10/21.
//

import Foundation

public class EntityGrantSearchCriteria:BaseSearchCriteria{
    
    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var entityId:UUID?
    public var name:String?
    public var userId:UUID?
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, entityId: UUID? = nil, name: String? = nil, userId: UUID? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.entityId = entityId
        self.name = name
        self.userId = userId
    }
    
    
}
