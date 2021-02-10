//
//  Family.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Models a family grouping of users.
 *
 */

public struct Family:Codable{
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var members:[FamilyMember]? = nil
    
    internal init(id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, members: [FamilyMember]? = nil) {
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.members = members
    }
}
