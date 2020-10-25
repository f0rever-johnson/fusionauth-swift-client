//
//  TwoFactorSendRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
