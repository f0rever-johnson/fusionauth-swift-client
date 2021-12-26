//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class ConnectorRequest:Codable{
    public var connector:BaseConnectorConfiguration?
    
    public init(connector:BaseConnectorConfiguration? = nil){
        self.connector = connector
    }
}
