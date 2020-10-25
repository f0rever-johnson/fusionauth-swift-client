//
//  PendingResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct PendingResponse:Codable{
    public var users:[User]? = nil

    public init(users: [User]? = nil) {
        self.users = users
    }

}
