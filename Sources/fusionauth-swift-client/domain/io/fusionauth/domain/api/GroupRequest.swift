//
//  GroupRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
