//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class ConnectorResponse:Codable{

    public var connector:BaseConnectorConfiguration?
    public var connectors:[BaseConnectorConfiguration]?
    
    public init(connector: BaseConnectorConfiguration? = nil, connectors: [BaseConnectorConfiguration]? = nil) {
        self.connector = connector
        self.connectors = connectors
    }
    
}
