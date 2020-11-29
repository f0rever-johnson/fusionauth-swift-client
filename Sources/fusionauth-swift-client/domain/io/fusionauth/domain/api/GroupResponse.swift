//
//  GroupResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct GroupResponse:Codable {
    public var group:Group? = nil
    public var groups:[Group]? = nil

    public init(group: Group? = nil, groups: [Group]? = nil) {
        self.group = group
        self.groups = groups
    }

}
