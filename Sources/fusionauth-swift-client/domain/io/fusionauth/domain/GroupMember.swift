//
//  GroupMember.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Group Member Object.
 */

public struct GroupMember:Codable {
    public var data:[String:JSONObject]? = nil
    public var groupId:UUID? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var userId:UUID? = nil

    public init(data: [String:JSONObject]? = nil, groupId: UUID? = nil, id: UUID? = nil, insertInstant: Date? = nil, userId: UUID? = nil) {
        self.data = data
        self.groupId = groupId
        self.id = id
        self.insertInstant = insertInstant
        self.userId = userId
    }

}

