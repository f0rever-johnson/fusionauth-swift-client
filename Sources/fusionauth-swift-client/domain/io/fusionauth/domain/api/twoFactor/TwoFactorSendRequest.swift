//
//  TwoFactorSendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TwoFactorSendRequest:Codable {

    public var email:String?
    public var method:String?
    public var methodId:String?
    public var mobilePhone:String?
    public var userId:UUID?
    
    public init(email: String? = nil, method: String? = nil, methodId: String? = nil, mobilePhone: String? = nil, userId: UUID? = nil) {
        self.email = email
        self.method = method
        self.methodId = methodId
        self.mobilePhone = mobilePhone
        self.userId = userId
    }

}
