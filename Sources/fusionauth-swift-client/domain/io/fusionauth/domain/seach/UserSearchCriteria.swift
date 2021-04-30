//
//  UserSearchCriteria.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Search Criteria Object.
 * This class is the user query. It provides a build pattern as well as public fields for use on forms and in actions.
 */

public class UserSearchCriteria:BaseElasticSearchCriteria, Codable {

    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var accurateTotal: Bool? = nil
    public var ids: [UUID]? = nil
    public var query: String? = nil
    public var sortFields: [SortField]? = nil
     
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


