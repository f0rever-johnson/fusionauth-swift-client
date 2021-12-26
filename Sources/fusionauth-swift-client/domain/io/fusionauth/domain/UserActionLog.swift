//
//  UserActionLog.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Action Log Object
 */

public struct UserActionLog:Codable {
    public var actioneeUserId:UUID?
    public var actionerUserId:UUID?
    public var applicationIds:[UUID]?
    public var comment:String?
    public var createInstant:Date?
    public var emailUserOnEnd:Bool?
    public var endEventSent:Bool?
    public var expiry:Date?
    public var history:LogHistory?
    public var id:UUID?
    public var insertInstant:Date?
    public var localizedName:String?
    public var localizedOption:String?
    public var localizedReason:String?
    public var name:String?
    public var notifyUserOnEnd:Bool?
    public var option:String?
    public var reason:String?
    public var reasonCode:String?
    public var userActionId:UUID?
    
    public init(actioneeUserId: UUID? = nil, actionerUserId: UUID? = nil, applicationIds: [UUID]? = nil, comment: String? = nil, createInstant: Date? = nil, emailUserOnEnd: Bool? = nil, endEventSent: Bool? = nil, expiry: Date? = nil, history: LogHistory? = nil, id: UUID? = nil, insertInstant: Date? = nil, localizedName: String? = nil, localizedOption: String? = nil, localizedReason: String? = nil, name: String? = nil, notifyUserOnEnd: Bool? = nil, option: String? = nil, reason: String? = nil, reasonCode: String? = nil, userActionId: UUID? = nil) {
        self.actioneeUserId = actioneeUserId
        self.actionerUserId = actionerUserId
        self.applicationIds = applicationIds
        self.comment = comment
        self.createInstant = createInstant
        self.emailUserOnEnd = emailUserOnEnd
        self.endEventSent = endEventSent
        self.expiry = expiry
        self.history = history
        self.id = id
        self.insertInstant = insertInstant
        self.localizedName = localizedName
        self.localizedOption = localizedOption
        self.localizedReason = localizedReason
        self.name = name
        self.notifyUserOnEnd = notifyUserOnEnd
        self.option = option
        self.reason = reason
        self.reasonCode = reasonCode
        self.userActionId = userActionId
    }
}
