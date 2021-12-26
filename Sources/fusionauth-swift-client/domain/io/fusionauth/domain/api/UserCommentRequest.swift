//
//  UserCommentRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserCommentRequest:Codable{
    public var userComment:UserComment?

    public init(userComment: UserComment? = nil) {
        self.userComment = userComment
    }
}
