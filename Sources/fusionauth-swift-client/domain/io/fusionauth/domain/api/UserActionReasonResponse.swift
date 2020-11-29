//
//  UserActionReasonResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
