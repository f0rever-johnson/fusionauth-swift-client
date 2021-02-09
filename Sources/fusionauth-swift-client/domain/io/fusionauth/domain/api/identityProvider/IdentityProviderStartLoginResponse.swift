//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation


public class IdentityProviderStartLoginResponse:BaseLoginRequest, Codable{
    public var applicationId: UUID?
    public var ipAddress: String?
    public var metaData: MetaData?
    public var noJWT: Bool?
    public var code: String?
    
    public init(applicationId: UUID? = nil, ipAddress: String? = nil, metaData: MetaData? = nil, noJWT: Bool? = nil, code: String? = nil) {
        self.applicationId = applicationId
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.noJWT = noJWT
        self.code = code
    }
    
    
    
}
