//
//  UserActionReasonResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserActionReasonResponse:Codable {
    public var userActionReason:UserActionReason? = nil
    public var userActionReasons:[UserActionReason]? = nil


    public init(userActionReason: UserActionReason? = nil, userActionReasons: [UserActionReason]? = nil) {
        self.userActionReason = userActionReason
        self.userActionReasons = userActionReasons
    }
}
