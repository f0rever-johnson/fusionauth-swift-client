//
//  ActionResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct ActionResponse:Codable {
    public var action:UserActionLog? = nil
    public var actions:[UserActionLog]? = nil

    public init(action: UserActionLog? = nil, actions: [UserActionLog]? = nil) {
        self.action = action
        self.actions = actions
    }

}
