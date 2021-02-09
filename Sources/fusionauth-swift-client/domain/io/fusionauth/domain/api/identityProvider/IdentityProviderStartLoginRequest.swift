//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class IdentityProviderStartLoginRequest:BaseLoginRequest, Codable{
    public var applicationId: UUID?
    public var ipAddress: String?
    public var metaData: MetaData?
    public var noJWT: Bool?
    public var data:[String:String]?
    public var identityProviderId:UUID?
    public var loginId:String?
    public var state:[String:JSONObject]?
    
    public init(applicationId: UUID? = nil, ipAddress: String? = nil, metaData: MetaData? = nil, noJWT: Bool? = nil, data: [String : String]? = nil, identityProviderId: UUID? = nil, loginId: String? = nil, state: [String : JSONObject]? = nil) {
        self.applicationId = applicationId
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.noJWT = noJWT
        self.data = data
        self.identityProviderId = identityProviderId
        self.loginId = loginId
        self.state = state
    }
    
    
    
    
    
}
