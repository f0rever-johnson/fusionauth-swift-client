//
//  LDAPConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class LDAPConnectorConfiguration:BaseConnectorConfiguration{
    public var authenticationURL:String
    public var baseStructure:String
    public var connectTimeout:Int?
    public var identifyingAttribute:String
    public var lambdaConfiguration:ConnectorLambdaConfiguration
}
