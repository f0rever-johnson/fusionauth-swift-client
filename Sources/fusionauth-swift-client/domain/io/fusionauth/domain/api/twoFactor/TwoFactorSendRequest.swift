//
//  TwoFactorSendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TwoFactorSendRequest:Codable {

    public var email:String? = nil
    public var method:String? = nil
    public var methodId:String? = nil
    public var mobilePhone:String? = nil
    public var userId:UUID? = nil
    
    public init(email: String? = nil, method: String? = nil, methodId: String? = nil, mobilePhone: String? = nil, userId: UUID? = nil) {
        self.email = email
        self.method = method
        self.methodId = methodId
        self.mobilePhone = mobilePhone
        self.userId = userId
    }

}
