//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class ConnectorResponse:Codable{

    public var connector:BaseConnectorConfiguration? = nil
    public var connectors:[BaseConnectorConfiguration]? = nil
    
    public init(connector: BaseConnectorConfiguration? = nil, connectors: [BaseConnectorConfiguration]? = nil) {
        self.connector = connector
        self.connectors = connectors
    }
    
}
