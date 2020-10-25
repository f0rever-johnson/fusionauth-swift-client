//
//  GroupRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct GroupRequest:Codable {
    public var group:Group? = nil
    public var roleIds:[UUID]? = nil

    public init(group: Group? = nil, roleIds: [UUID]? = nil) {
        self.group = group
        self.roleIds = roleIds
    }

}
