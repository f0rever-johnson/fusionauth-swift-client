//
//  SearchResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct SearchResponse:Codable {
    public var total:UInt64?
    public var users:[User]?


    public init(total: UInt64? = nil, users: [User]? = nil) {
        self.total = total
        self.users = users
    }
}
