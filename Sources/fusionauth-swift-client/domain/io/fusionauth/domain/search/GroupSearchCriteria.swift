//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/3/22.
//

import Foundation


public class GroupSearchCriteria:BaseSearchCriteria{

    public var numberOfResults:Int?
    
    public var orderBy:String?
    
    public var startRow:Int?
    
    public var id:UUID?
    
    public var name:String?
    
    public var tenantId:UUID?
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, id: UUID? = nil, name: String? = nil, tenantId: UUID? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.id = id
        self.name = name
        self.tenantId = tenantId
    }
    
}
