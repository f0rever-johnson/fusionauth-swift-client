//
//  MemberResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct MemberResponse:Codable {
    public var members:[UUID:[GroupMember]]? = nil

    public init(members: [UUID:[GroupMember]]? = nil) {
        self.members = members
    }

}
