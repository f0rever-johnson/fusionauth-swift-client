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

public class UserSearchCriteria:BaseSearchCriteria, Codable {
    
    public var ids:[UUID]? = nil
    public var query:String? = nil
    public var queryString:String? = nil
    public var sortFields:[SortField]? = nil
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    

    public init(ids: [UUID]? = nil, query: String? = nil, queryString: String? = nil, sortFields: [SortField]? = nil) {
        self.ids = ids
        self.query = query
        self.queryString = queryString
        self.sortFields = sortFields
    }
}


