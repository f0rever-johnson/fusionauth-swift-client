//
//  SearchRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct SearchRequest:Codable {
    public var search:UserSearchCriteria?

    public init(search: UserSearchCriteria? = nil) {
        self.search = search
    }

}
