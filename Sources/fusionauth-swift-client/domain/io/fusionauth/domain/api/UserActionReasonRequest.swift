//
//  UserActionReasonRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserActionReasonRequest:Codable {
    public var userActionReason:UserActionReason? = nil

    public init(userActionReason: UserActionReason? = nil) {
        self.userActionReason = userActionReason
    }
}
