//
//  HistoryItems.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class HistoryItem:Codable{
    public var actionerUserId:UUID?
    public var comment:String?
    public var createInstant:Date?
    public var expiry:Date?

    public init(actionerUserId: UUID? = nil, comment: String? = nil, createInstant: Date? = nil, expiry: Date? = nil) {
        self.actionerUserId = actionerUserId
        self.comment = comment
        self.createInstant = createInstant
        self.expiry = expiry
    }

}
