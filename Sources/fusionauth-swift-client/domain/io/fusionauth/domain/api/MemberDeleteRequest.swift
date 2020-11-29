//
//  MemberDeleteRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct MemberDeleteRequest:Codable {
    public var memberIds:[UUID]? = nil
    public var members:[UUID:[UUID]]? = nil

    public init(memberIds: [UUID]? = nil, members: [UUID:[UUID]]? = nil) {
        self.memberIds = memberIds
        self.members = members
    }

}
