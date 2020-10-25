//
//  GroupResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
