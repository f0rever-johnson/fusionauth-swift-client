//
//  HistoryItems.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class HistoryItem:Codable{
    public var actionerUserId:UUID? = nil
    public var comment:String? = nil
    public var createInstant:Date? = nil
    public var expiry:Date? = nil

    public init(actionerUserId: UUID? = nil, comment: String? = nil, createInstant: Date? = nil, expiry: Date? = nil) {
        self.actionerUserId = actionerUserId
        self.comment = comment
        self.createInstant = createInstant
        self.expiry = expiry
    }

}
