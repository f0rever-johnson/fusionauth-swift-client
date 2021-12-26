//
//  ActionResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct ActionResponse:Codable {
    public var action:UserActionLog?
    public var actions:[UserActionLog]?

    public init(action: UserActionLog? = nil, actions: [UserActionLog]? = nil) {
        self.action = action
        self.actions = actions
    }

}
