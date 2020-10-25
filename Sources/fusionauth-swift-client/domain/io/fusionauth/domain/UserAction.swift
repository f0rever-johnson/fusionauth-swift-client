//
//  UserAction.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Action Object
 */

public class UserAction:Codable {
    public var active:Bool? = nil
    public var cancelEmailTemplateId:UUID? = nil
    public var endEmailTemplateId:UUID? = nil
    public var id:UUID? = nil
    public var includeEmailInEventJSON:Bool? = nil
    public var localizedNames:LocalizedStrings? = nil
    public var modifyEmailTemplateId:UUID? = nil
    public var name:String? = nil
    public var options:[UserActionOption]? = nil
    public var preventLogin:Bool? = nil
    public var sendEndEvent:Bool? = nil
    public var startEmailTemplateId:UUID? = nil
    public var temporal:Bool? = nil
    public var transactionType:TransactionType? = nil
    public var userEmailingEnabled:Bool? = nil
    public var userNotificationsEnabled:Bool? = nil


    public init(active: Bool? = nil, cancelEmailTemplateId: UUID? = nil, endEmailTemplateId: UUID? = nil, id: UUID? = nil, includeEmailInEventJSON: Bool? = nil, localizedNames: LocalizedStrings? = nil, modifyEmailTemplateId: UUID? = nil, name: String? = nil, options: [UserActionOption]? = nil, preventLogin: Bool? = nil, sendEndEvent: Bool? = nil, startEmailTemplateId: UUID? = nil, temporal: Bool? = nil, transactionType: TransactionType? = nil, userEmailingEnabled: Bool? = nil, userNotificationsEnabled: Bool? = nil) {
        self.active = active
        self.cancelEmailTemplateId = cancelEmailTemplateId
        self.endEmailTemplateId = endEmailTemplateId
        self.id = id
        self.includeEmailInEventJSON = includeEmailInEventJSON
        self.localizedNames = localizedNames
        self.modifyEmailTemplateId = modifyEmailTemplateId
        self.name = name
        self.options = options
        self.preventLogin = preventLogin
        self.sendEndEvent = sendEndEvent
        self.startEmailTemplateId = startEmailTemplateId
        self.temporal = temporal
        self.transactionType = transactionType
        self.userEmailingEnabled = userEmailingEnabled
        self.userNotificationsEnabled = userNotificationsEnabled
    }
}
