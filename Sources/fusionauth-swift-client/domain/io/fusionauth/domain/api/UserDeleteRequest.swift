//
//  UserDeleteRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
