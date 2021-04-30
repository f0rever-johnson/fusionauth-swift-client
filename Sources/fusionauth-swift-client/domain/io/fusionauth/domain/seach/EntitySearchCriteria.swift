//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation


public class EntitySearchCriteria: BaseElasticSearchCriteria, Codable {

    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var accurateTotal: Bool? = nil
    public var ids: [UUID]? = nil
    public var query: String? = nil
    public var sortFields: [SortField]? = nil
    public var tenantId:UUID? = nil
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, accurateTotal: Bool? = nil, ids: [UUID]? = nil, query: String? = nil, sortFields: [SortField]? = nil, tenantId: UUID? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.accurateTotal = accurateTotal
        self.ids = ids
        self.query = query
        self.sortFields = sortFields
        self.tenantId = tenantId
    }

}
