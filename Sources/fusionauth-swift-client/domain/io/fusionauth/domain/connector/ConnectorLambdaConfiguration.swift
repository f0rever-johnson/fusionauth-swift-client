//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

//Renamed from LambdaConfiguration

public class ConnectorLambdaConfiguration:Codable{
    public var reconcileId:UUID?
    
    public init(reconcileId:UUID? = nil){
        self.reconcileId = reconcileId
    }
}
