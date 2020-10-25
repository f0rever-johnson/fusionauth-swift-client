//
//  UserComment.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Comment Object
 */

public struct UserComment:Codable {
    public var comment:String? = nil
    public var commenterId:UUID? = nil
    public var createInstant:Date? = nil
    public var id:UUID? = nil
    public var userId:UUID? = nil

    public init(comment: String? = nil, commenterId: UUID? = nil, createInstant: Date? = nil, id: UUID? = nil, userId: UUID? = nil) {
        self.comment = comment
        self.commenterId = commenterId
        self.createInstant = createInstant
        self.id = id
        self.userId = userId
    }

}
