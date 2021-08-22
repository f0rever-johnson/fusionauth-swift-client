//
//  TenantRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class TenantRequest:BaseEventRequest {
    
    public var sourceTenantId:UUID? = nil
    public var tenant:Tenant? = nil

    public init(eventInfo: EventInfo? = nil, sourceTenantId: UUID? = nil, tenant: Tenant? = nil) {
        self.sourceTenantId = sourceTenantId
        self.tenant = tenant
        super.init(eventInfo:eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sourceTenantId = try container.decode(UUID.self, forKey: .sourceTenantId)
        self.tenant = try container.decode(Tenant.self, forKey: .tenant)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case sourceTenantId
        case tenant
    }

}
