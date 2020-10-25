//
//  Group.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Group Object.
 */

public struct Group:Codable{
    public var data:[String:JSONObject]? = nil
    public var id:UUID? = nil
    public var name:String? = nil
    public var roles:[UUID:[ApplicationRole]]? = nil
    public var tenantId:UUID? = nil

    public init(data: [String:JSONObject]? = nil, id: UUID? = nil, name: String? = nil, roles: [UUID:[ApplicationRole]]? = nil, tenantId: UUID? = nil) {
        self.data = data
        self.id = id
        self.name = name
        self.roles = roles
        self.tenantId = tenantId
    }

}
