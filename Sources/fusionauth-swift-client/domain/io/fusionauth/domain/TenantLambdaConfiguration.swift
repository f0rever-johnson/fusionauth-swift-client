//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class TenantLambdaConfiguration:Codable{

    public var scimEnterpriseUserRequestConverterId:UUID?
    public var scimEnterpriseUserResponseCOnverterId:UUID?
    public var scimGroupRequestConverterId:UUID?
    public var scimGroupResponseConverterId:UUID?
    public var scimUserRequestConverterId:UUID?
    public var scimUserResponseConverterId:UUID?
    
    public init(scimEnterpriseUserRequestConverterId: UUID? = nil, scimEnterpriseUserResponseCOnverterId: UUID? = nil, scimGroupRequestConverterId: UUID? = nil, scimGroupResponseConverterId: UUID? = nil, scimUserRequestConverterId: UUID? = nil, scimUserResponseConverterId: UUID? = nil) {
        self.scimEnterpriseUserRequestConverterId = scimEnterpriseUserRequestConverterId
        self.scimEnterpriseUserResponseCOnverterId = scimEnterpriseUserResponseCOnverterId
        self.scimGroupRequestConverterId = scimGroupRequestConverterId
        self.scimGroupResponseConverterId = scimGroupResponseConverterId
        self.scimUserRequestConverterId = scimUserRequestConverterId
        self.scimUserResponseConverterId = scimUserResponseConverterId
    }
}
