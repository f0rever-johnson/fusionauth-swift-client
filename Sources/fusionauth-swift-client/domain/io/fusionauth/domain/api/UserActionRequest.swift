//
//  UserActionRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserActionRequest:Codable {
    public var userAction:UserAction? = nil

    public init(userAction: UserAction? = nil) {
        self.userAction = userAction
    }
}
