//
//  TenantResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TenantResponse:Codable {
    public var tenant:Tenant?
    public var tenants:[Tenant]?

    public init(tenant: Tenant? = nil, tenants: [Tenant]? = nil) {
        self.tenant = tenant
        self.tenants = tenants
    }

}
