//
//  UserActionEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserActionEvent:BaseEvent, Codable{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var action:String? = nil
    public var actionId:UUID? = nil
    public var actioneeUserId:UUID? = nil
    public var actionerUserId:UUID? = nil
    public var applicationIds:[UUID]? = nil
    public var comment:String? = nil
    public var email:Email? = nil
    public var emailedUser:Bool? = nil
    public var expiry:Date? = nil
    public var localizedAction:String? = nil
    public var localizedDuration:String? = nil
    public var localizedOption:String? = nil
    public var localizedReason:String? = nil
    public var notifyUser:Bool? = nil
    public var option:String? = nil
    public var phase:UserActionPhase? = nil
    public var reason:String? = nil
    public var reasonCode:String? = nil
    
    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, action: String? = nil, actionId: UUID? = nil, actioneeUserId: UUID? = nil, actionerUserId: UUID? = nil, applicationIds: [UUID]? = nil, comment: String? = nil, email: Email? = nil, emailedUser: Bool? = nil, expiry: Date? = nil, localizedAction: String? = nil, localizedDuration: String? = nil, localizedOption: String? = nil, localizedReason: String? = nil, notifyUser: Bool? = nil, option: String? = nil, phase: UserActionPhase? = nil, reason: String? = nil, reasonCode: String? = nil) {
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

