//
//  UserCommentRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserCommentRequest:Codable{
    public var userComment:UserComment? = nil

    public init(userComment: UserComment? = nil) {
        self.userComment = userComment
    }
}
