//
//  IntegrationResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IntegrationResponse:Codable {
    public var intergrations:Integrations? = nil

    public init(intergrations: Integrations? = nil) {
        self.intergrations = intergrations
    }
}
