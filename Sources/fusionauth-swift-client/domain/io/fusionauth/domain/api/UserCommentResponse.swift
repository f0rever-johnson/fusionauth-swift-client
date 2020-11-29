//
//  UserCommentResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
