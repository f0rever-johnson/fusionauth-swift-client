//
//  UserActionReasonRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserActionReasonRequest:Codable {
    public var userActionReason:UserActionReason? = nil

    public init(userActionReason: UserActionReason? = nil) {
        self.userActionReason = userActionReason
    }
}
