//
//  IdentityProviderLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct IdentityProviderLoginRequest:BaseLoginRequest, Codable{
    public var ipAddress: String? = nil
    public var metaData: MetaData? = nil
    public var encodedJWT:String? = nil
    public var applicationId: UUID? = nil
    public var noJWT: Bool? = nil
    public var data:[String:String]? = nil
    public var identityProviderId:UUID? = nil


    public init(ipAddress: String? = nil, metaData: MetaData? = nil, encodedJWT: String? = nil, applicationId: UUID? = nil, noJWT: Bool? = nil, data: [String:JSONObject]? = nil, identityProviderId: UUID? = nil) {
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.encodedJWT = encodedJWT
        self.applicationId = applicationId
        self.noJWT = noJWT
        self.data = data
        self.identityProviderId = identityProviderId
    }
}
