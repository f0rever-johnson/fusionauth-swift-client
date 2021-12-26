//
//  GroupResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct GroupResponse:Codable {
    public var group:Group?
    public var groups:[Group]?

    public init(group: Group? = nil, groups: [Group]? = nil) {
        self.group = group
        self.groups = groups
    }

}
