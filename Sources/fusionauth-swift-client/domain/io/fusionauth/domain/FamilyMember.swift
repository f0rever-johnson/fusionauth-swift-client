//
//  FamilyMember.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Models a single family member.
 *
 */

public class FamilyMember:Codable{
    public var data:[String:JSONObject]?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var owner:Bool?
    public var role:FamilyRole?
    public var userId:UUID?

    public init(data: [String : JSONObject]? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, owner: Bool? = nil, role: FamilyRole? = nil, userId: UUID? = nil) {
        self.data = data
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.owner = owner
        self.role = role
        self.userId = userId
    }
}
