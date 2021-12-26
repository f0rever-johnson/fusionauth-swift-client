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
    public var data:[String:JSONObject]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var roles:[UUID:[ApplicationRole]]?
    public var tenantId:UUID?

    public init(data: [String:JSONObject]? = nil, id: UUID? = nil, name: String? = nil, roles: [UUID:[ApplicationRole]]? = nil, tenantId: UUID? = nil) {
        self.data = data
        self.id = id
        self.name = name
        self.roles = roles
        self.tenantId = tenantId
    }

}
