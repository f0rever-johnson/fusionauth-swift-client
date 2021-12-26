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
    
    public var active:Bool?
    public var cancelEmailTemplateId:UUID?
    public var endEmailTemplateId:UUID?
    public var id:UUID?
    public var includeEmailInEventJSON:Bool?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var localizedNames:LocalizedStrings?
    public var modifyEmailTemplateId:UUID?
    public var name:String?
    public var options:[UserActionOption]?
    public var preventLogin:Bool?
    public var sendEndEvent:Bool?
    public var startEmailTemplateId:UUID?
    public var temporal:Bool?
    public var transactionType:TransactionType?
    public var userEmailingEnabled:Bool?
    public var userNotificationsEnabled:Bool?
    
    public init(active: Bool? = nil, cancelEmailTemplateId: UUID? = nil, endEmailTemplateId: UUID? = nil, id: UUID? = nil, includeEmailInEventJSON: Bool? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, localizedNames: LocalizedStrings? = nil, modifyEmailTemplateId: UUID? = nil, name: String? = nil, options: [UserActionOption]? = nil, preventLogin: Bool? = nil, sendEndEvent: Bool? = nil, startEmailTemplateId: UUID? = nil, temporal: Bool? = nil, transactionType: TransactionType? = nil, userEmailingEnabled: Bool? = nil, userNotificationsEnabled: Bool? = nil) {
        self.active = active
        self.cancelEmailTemplateId = cancelEmailTemplateId
        self.endEmailTemplateId = endEmailTemplateId
        self.id = id
        self.includeEmailInEventJSON = includeEmailInEventJSON
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
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
