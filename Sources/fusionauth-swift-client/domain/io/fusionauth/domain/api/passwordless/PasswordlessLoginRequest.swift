//
//  PasswordlessLoginRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class PasswordlessLoginRequest:BaseLoginRequest, Codable{
    public var applicationId: UUID? = nil
    public var ipAddress: String? = nil
    public var metaData: MetaData? = nil
    public var noJWT: Bool? = nil
    public var code:String? = nil
    public var twoFactorTrustId:String? = nil

    public init(applicationId: UUID? = nil, ipAddress: String? = nil, metaData: MetaData? = nil, noJWT: Bool? = nil, code: String? = nil, twoFactorTrustId: String? = nil) {
        self.applicationId = applicationId
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.noJWT = noJWT
        self.code = code
        self.twoFactorTrustId = twoFactorTrustId
    }

}
