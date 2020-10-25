//
//  SearchRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct SearchRequest:Codable {
    public var search:UserSearchCriteria? = nil

    public init(search: UserSearchCriteria? = nil) {
        self.search = search
    }

}
