//
//  TwoFactorSendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TwoFactorSendRequest:Codable {
    public var mobilePhone:String? = nil
    public var secret:String? = nil
    public var userId:UUID? = nil

    public init(mobilePhone: String? = nil, secret: String? = nil, userId: UUID? = nil) {
        self.mobilePhone = mobilePhone
        self.secret = secret
        self.userId = userId
    }
}
