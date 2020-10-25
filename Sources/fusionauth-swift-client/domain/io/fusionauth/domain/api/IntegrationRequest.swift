//
//  IntegrationRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IntegrationRequest:Codable {
    public var integrations:Integrations? = nil

    public init(integrations: Integrations? = nil) {
        self.integrations = integrations
    }

}
