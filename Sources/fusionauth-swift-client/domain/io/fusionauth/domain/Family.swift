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
    public var members:[FamilyMember]? = nil


    public init(id: UUID? = nil, members: [FamilyMember]? = nil) {
        self.id = id
        self.members = members
    }
}
