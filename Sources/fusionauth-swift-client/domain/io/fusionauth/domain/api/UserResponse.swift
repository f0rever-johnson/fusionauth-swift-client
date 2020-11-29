//
//  UserResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
