//
//  TenantRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
