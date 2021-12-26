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
    public var comment:String?
    public var commenterId:UUID?
    public var id:UUID?
    public var insertInstant:Date?
    public var userId:UUID?

    public init(comment: String? = nil, commenterId: UUID? = nil, createInstant: Date? = nil, id: UUID? = nil, userId: UUID? = nil) {
        self.comment = comment
        self.commenterId = commenterId
        self.insertInstant = createInstant
        self.id = id
        self.userId = userId
    }

}
