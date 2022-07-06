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

    public var data:[String:JSONObject]?
    public var groupId:UUID?
    public var id:UUID?
    public var insertInstant:Date?
    public var user:User?
    public var userId:UUID?

    public init(data: [String : JSONObject]? = nil, groupId: UUID? = nil, id: UUID? = nil, insertInstant: Date? = nil, user: User? = nil, userId: UUID? = nil) {
        self.data = data
        self.groupId = groupId
        self.id = id
        self.insertInstant = insertInstant
        self.user = user
        self.userId = userId
    }

}

