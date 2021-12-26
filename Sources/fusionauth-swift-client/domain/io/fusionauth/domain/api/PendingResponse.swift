//
//  PendingResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct PendingResponse:Codable{
    public var users:[User]?

    public init(users: [User]? = nil) {
        self.users = users
    }

}
