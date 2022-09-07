//
//  UserActionEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

//Models the user action Event.

public class UserActionEvent:BaseEvent, Codable{

    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var action:String?
    public var actionId:UUID?
    public var actioneeUserId:UUID?
    public var actionerUserId:UUID?
    public var comment:String?
    public var email:Email?
    public var emailedUser:Bool?
    public var expiry:Date?
    public var localizedAction:String?
    public var localizedDuration:String?
    public var localizedOption:String?
    public var localizedReason:String?
    public var notifyUser:Bool?
    public var option:String?
    public var phase:UserActionPhase?
    public var reason:String?
    public var reasonCode:String?
    
    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, action: String? = nil, actionId: UUID? = nil, actioneeUserId: UUID? = nil, actionerUserId: UUID? = nil, comment: String? = nil, email: Email? = nil, emailedUser: Bool? = nil, expiry: Date? = nil, localizedAction: String? = nil, localizedDuration: String? = nil, localizedOption: String? = nil, localizedReason: String? = nil, notifyUser: Bool? = nil, option: String? = nil, phase: UserActionPhase? = nil, reason: String? = nil, reasonCode: String? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.action = action
        self.actionId = actionId
        self.actioneeUserId = actioneeUserId
        self.actionerUserId = actionerUserId
        self.applicationIds = applicationIds
        self.comment = comment
        self.email = email
        self.emailedUser = emailedUser
        self.expiry = expiry
        self.localizedAction = localizedAction
        self.localizedDuration = localizedDuration
        self.localizedOption = localizedOption
        self.localizedReason = localizedReason
        self.notifyUser = notifyUser
        self.option = option
        self.phase = phase
        self.reason = reason
        self.reasonCode = reasonCode
    }
}

