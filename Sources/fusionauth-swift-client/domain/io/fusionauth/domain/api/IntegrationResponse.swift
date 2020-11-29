//
//  IntegrationResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct IntegrationResponse:Codable {
    public var intergrations:Integrations? = nil

    public init(intergrations: Integrations? = nil) {
        self.intergrations = intergrations
    }
}
