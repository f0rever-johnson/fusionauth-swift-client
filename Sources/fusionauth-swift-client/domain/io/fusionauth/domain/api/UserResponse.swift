//
//  UserResponse.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserResponse:Codable {
    public var user:User? = nil
    public var users:[User]? = nil

    public init(user: User? = nil, users: [User]? = nil) {
        self.user = user
        self.users = users
    }
}
