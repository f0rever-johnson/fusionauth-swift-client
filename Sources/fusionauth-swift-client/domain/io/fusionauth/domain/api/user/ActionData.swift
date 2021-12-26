//
//  ActionData.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ActionData:Codable{
    public var actioneeUserId:UUID?
    public var actionerUserId:UUID?
    public var applicationIds:[UUID]?
    public var comment:String?
    public var emailUser:Bool?
    public var expiry:Date?
    public var notifyUser:Bool?
    public var option:String?
    public var reasonId:UUID?
    public var userActionId:UUID?


    public init(actioneeUserId: UUID? = nil, actionerUserId: UUID? = nil, applicationIds: [UUID]? = nil, comment: String? = nil, emailUser: Bool? = nil, expiry: Date? = nil, notifyUser: Bool? = nil, option: String? = nil, reasonId: UUID? = nil, userActionId: UUID? = nil) {
        self.actioneeUserId = actioneeUserId
        self.actionerUserId = actionerUserId
        self.applicationIds = applicationIds
        self.comment = comment
        self.emailUser = emailUser
        self.expiry = expiry
        self.notifyUser = notifyUser
        self.option = option
        self.reasonId = reasonId
        self.userActionId = userActionId
    }
}
