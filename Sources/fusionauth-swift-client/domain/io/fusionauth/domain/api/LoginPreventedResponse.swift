//
//  LoginPreventedResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct LoginPreventedResponse:Codable{
    public var actionid:UUID?
    public var actionerUserId:UUID?
    public var expiry:Date?
    public var localizedName:String?
    public var localizedOption:String?
    public var localizedReason:String?
    public var name:String?
    public var option:String?
    public var reason:String?
    public var reasonCode:String?

    public init(actionid: UUID? = nil, actionerUserId: UUID? = nil, expiry: Date? = nil, localizedName: String? = nil, localizedOption: String? = nil, localizedReason: String? = nil, name: String? = nil, option: String? = nil, reason: String? = nil, reasonCode: String? = nil) {
        self.actionid = actionid
        self.actionerUserId = actionerUserId
        self.expiry = expiry
        self.localizedName = localizedName
        self.localizedOption = localizedOption
        self.localizedReason = localizedReason
        self.name = name
        self.option = option
        self.reason = reason
        self.reasonCode = reasonCode
    }

}
