//
//  TenantResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct TenantResponse:Codable {
    public var tenant:Tenant? = nil
    public var tenants:[Tenant]? = nil

    public init(tenant: Tenant? = nil, tenants: [Tenant]? = nil) {
        self.tenant = tenant
        self.tenants = tenants
    }

}
