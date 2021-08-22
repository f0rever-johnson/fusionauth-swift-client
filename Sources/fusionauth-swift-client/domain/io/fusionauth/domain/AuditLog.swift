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

    public var data:[String:JSONObject]?
    public var id:Int?
    public var insertInstant:Date?
    public var insertUser:String?
    public var message:String?
    public var newValue:JSONObject?
    public var oldValue:JSONObject?
    public var reason:String?  

    public init(data: [String:JSONObject]? = nil, id: Int? = nil, insertInstant: Date? = nil, insertUser: String? = nil, message: String? = nil, newValue: JSONObject? = nil, oldValue: JSONObject? = nil, reason: String? = nil) {
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
