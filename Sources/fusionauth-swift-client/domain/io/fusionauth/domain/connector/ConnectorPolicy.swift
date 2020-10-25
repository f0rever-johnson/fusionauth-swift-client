//
//  ConnectorPolicy.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class ConnectorPolicy{
    public init(connectorId: UUID? = nil, date: JSONObject? = nil, domains: [String]? = nil, migrate: Bool? = nil) {
        self.connectorId = connectorId
        self.date = date
        self.domains = domains
        self.migrate = migrate
    }
    
    public var connectorId:UUID?
    public var date:JSONObject?
    public var domains:[String]?
    public var migrate:Bool?
}
