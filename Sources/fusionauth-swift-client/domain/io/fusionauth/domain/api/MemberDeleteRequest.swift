//
//  MemberDeleteRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
