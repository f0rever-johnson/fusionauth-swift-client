//
//  UserCommentResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserCommentResponse:Codable {
    public var userComment:UserComment? = nil
    public var userComments:[UserComment]? = nil

    public init(userComment: UserComment? = nil, userComments: [UserComment]? = nil) {
        self.userComment = userComment
        self.userComments = userComments
    }
}
