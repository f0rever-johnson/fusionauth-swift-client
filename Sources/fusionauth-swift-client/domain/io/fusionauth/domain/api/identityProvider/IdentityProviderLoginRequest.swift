//
//  IdentityProviderLoginRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IdentityProviderLoginRequest:BaseLoginRequest, Codable{
    public var ipAddress: String? = nil
    public var metaData: MetaData? = nil
    public var encodedJWT:String? = nil
    public var applicationId: UUID? = nil
    public var noJWT: Bool? = nil
    public var data:[String:JSONObject]? = nil
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
