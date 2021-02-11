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
    public var actioneeUserId:UUID? = nil
    public var actionerUserId:UUID? = nil
    public var applicationIds:[UUID]? = nil
    public var comment:String? = nil
    public var createInstant:Date? = nil
    public var emailUserOnEnd:Bool? = nil
    public var endEventSent:Bool? = nil
    public var expiry:Date? = nil
    public var history:LogHistory? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var localizedName:String? = nil
    public var localizedOption:String? = nil
    public var localizedReason:String? = nil
    public var name:String? = nil
    public var notifyUserOnEnd:Bool? = nil
    public var option:String? = nil
    public var reason:String? = nil
    public var reasonCode:String? = nil
    public var userActionId:UUID? = nil
    
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
