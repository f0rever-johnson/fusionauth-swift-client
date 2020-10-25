//
//  SearchResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct SearchResponse:Codable {
    public var total:UInt64? = nil
    public var users:[User]? = nil


    public init(total: UInt64? = nil, users: [User]? = nil) {
        self.total = total
        self.users = users
    }
}
