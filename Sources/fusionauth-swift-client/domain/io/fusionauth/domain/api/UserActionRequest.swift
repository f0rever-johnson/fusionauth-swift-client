//
//  UserActionRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserActionRequest:Codable {
    public var userAction:UserAction? = nil

    public init(userAction: UserAction? = nil) {
        self.userAction = userAction
    }
}
