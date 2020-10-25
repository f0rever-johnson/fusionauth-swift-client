//
//  ActionData.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class ActionData:Codable{
    public var actioneeUserId:UUID? = nil
    public var actionerUserId:UUID? = nil
    public var applicationIds:[UUID]? = nil
    public var comment:String? = nil
    public var emailUser:Bool? = nil
    public var expiry:Data? = nil
    public var notifyUser:Bool? = nil
    public var option:String? = nil
    public var reasonId:UUID? = nil
    public var userActionId:UUID? = nil


    public init(actioneeUserId: UUID? = nil, actionerUserId: UUID? = nil, applicationIds: [UUID]? = nil, comment: String? = nil, emailUser: Bool? = nil, expiry: Data? = nil, notifyUser: Bool? = nil, option: String? = nil, reasonId: UUID? = nil, userActionId: UUID? = nil) {
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
