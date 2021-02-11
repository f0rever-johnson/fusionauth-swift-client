//
//  LDAPConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class LDAPConnectorConfiguration:BaseConnectorConfiguration{
    public var authenticationURL:String?
    public var baseStructure:String?
    public var connectTimeout:Int?
    public var identifyingAttribute:String?
    public var lambdaConfiguration:ConnectorLambdaConfiguration?
    public var loginIdAttribute:String?
    public var readTimeout:Int?
    public var requestedAttributes:[String]?
    public var securityMethod:LDAPSecurityMethod?
    public var systemAccountDN:String?
    public var systemAccountPassword:String? 
    
}
