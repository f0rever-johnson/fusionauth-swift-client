//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class ConnectorLambdaConfiguration:Codable{
    public var reconcileId:UUID? = nil
    
    public init(reconcileId:UUID? = nil){
        self.reconcileId = reconcileId
    }
}
