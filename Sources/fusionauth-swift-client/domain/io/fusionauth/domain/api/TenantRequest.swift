//
//  TenantRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TenantRequest:Codable {
    public var sourceTenantId:UUID? = nil
    public var tenant:Tenant? = nil

    public init(sourceTenantId: UUID? = nil, tenant: Tenant? = nil) {
        self.sourceTenantId = sourceTenantId
        self.tenant = tenant
    }

}
