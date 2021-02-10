//
//  AuditLog.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Audit Log Object.
 */

public struct AuditLog:Codable {

    public var data:[String:JSONObject]? = nil
    public var id:Int? = nil
    public var insertInstant:Date? = nil
    public var insertUser:String? = nil
    public var message:String? = nil
    public var newValue:JSONObject? = nil
    public var oldValue:JSONObject? = nil
    public var reason:String? = nil

    public init(data: [String:String]? = nil, id: Int? = nil, insertInstant: Date? = nil, insertUser: String? = nil, message: String? = nil, newValue: JSONObject? = nil, oldValue: JSONObject? = nil, reason: String? = nil) {
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.insertUser = insertUser
        self.message = message
        self.newValue = newValue
        self.oldValue = oldValue
        self.reason = reason
    }

}
