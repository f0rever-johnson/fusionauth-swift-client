//
//  UserActionResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

public struct UserActionResponse:Codable {
    public var userAction:UserAction? = nil
    public var userActions:[UserAction]? = nil

    public init(userAction: UserAction? = nil, userActions: [UserAction]? = nil) {
        self.userAction = userAction
        self.userActions = userActions
    }
}
