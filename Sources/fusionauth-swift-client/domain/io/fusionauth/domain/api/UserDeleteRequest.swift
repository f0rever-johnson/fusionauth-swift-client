//
//  UserDeleteRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 1/24/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserDeleteRequest:Codable {
    public var hardDelete:Bool? = nil
    public var userIds:[UUID]? = nil

    public init(hardDelete: Bool? = nil, userIds: [UUID]? = nil) {
        self.hardDelete = hardDelete
        self.userIds = userIds
    }
}
