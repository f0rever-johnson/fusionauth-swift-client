//
//  UserActionResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserActionResponse:Codable {
    public var userAction:UserAction?
    public var userActions:[UserAction]?

    public init(userAction: UserAction? = nil, userActions: [UserAction]? = nil) {
        self.userAction = userAction
        self.userActions = userActions
    }
}
