//
//  MemberRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct MemberRequest:Codable {
    public var members:[UUID:[GroupMember]]? = nil

    public init(members: [UUID:[GroupMember]]? = nil) {
        self.members = members
    }

}
