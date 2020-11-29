//
//  LoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct LoginRequest:BaseLoginRequest, Codable{
    public var applicationId: UUID? = nil
    public var ipAddress: String? = nil
    public var metaData: MetaData? = nil
    public var noJWT: Bool? = nil
    public var loginId:String? = nil
    public var password:String? = nil
    public var twoFactorTrustId:String? = nil

    public init(applicationId: UUID? = nil, ipAddress: String? = nil, metaData: MetaData? = nil, noJWT: Bool? = nil, loginId: String? = nil, password: String? = nil, twoFactorTrustId: String? = nil) {
        self.applicationId = applicationId
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.noJWT = noJWT
        self.loginId = loginId
        self.password = password
        self.twoFactorTrustId = twoFactorTrustId
    }

}
