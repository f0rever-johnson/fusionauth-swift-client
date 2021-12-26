//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation


public class EntitySearchCriteria: BaseElasticSearchCriteria, Codable {

    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var accurateTotal: Bool?
    public var ids: [UUID]?
    public var query: String?
    public var sortFields: [SortField]?
    
    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, accurateTotal: Bool? = nil, ids: [UUID]? = nil, query: String? = nil, sortFields: [SortField]? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.accurateTotal = accurateTotal
        self.ids = ids
        self.query = query
        self.sortFields = sortFields
    }

}
