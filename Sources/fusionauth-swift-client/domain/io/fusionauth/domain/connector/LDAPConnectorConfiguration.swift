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
    
    public init(authenticationURL: String? = nil, baseStructure: String? = nil, connectTimeout: Int? = nil, identifyingAttribute: String? = nil, lambdaConfiguration: ConnectorLambdaConfiguration? = nil, loginIdAttribute: String? = nil, readTimeout: Int? = nil, requestedAttributes: [String]? = nil, securityMethod: LDAPSecurityMethod? = nil, systemAccountDN: String? = nil, systemAccountPassword: String? = nil, data: JSONObject? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: ConnectorType? = nil) {
        self.authenticationURL = authenticationURL
        self.baseStructure = baseStructure
        self.connectTimeout = connectTimeout
        self.identifyingAttribute = identifyingAttribute
        self.lambdaConfiguration = lambdaConfiguration
        self.loginIdAttribute = loginIdAttribute
        self.readTimeout = readTimeout
        self.requestedAttributes = requestedAttributes
        self.securityMethod = securityMethod
        self.systemAccountDN = systemAccountDN
        self.systemAccountPassword = systemAccountPassword
        super.init(data: data, debug: debug, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, type: type)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationURL = try container.decode(String.self, forKey: .authenticationURL)
        self.baseStructure = try container.decode(String.self, forKey: .baseStructure)
        self.connectTimeout = try container.decode(Int.self, forKey: .connectTimeout)
        self.identifyingAttribute = try container.decode(String.self, forKey: .identifyingAttribute)
        self.lambdaConfiguration = try container.decode(ConnectorLambdaConfiguration.self, forKey: .lambdaConfiguration)
        self.loginIdAttribute = try container.decode(String.self, forKey: .loginIdAttribute)
        self.readTimeout = try container.decode(Int.self, forKey: .readTimeout)
        self.requestedAttributes = try container.decode([String].self, forKey: .requestedAttributes)
        self.securityMethod = try container.decode(LDAPSecurityMethod.self, forKey: .securityMethod)
        self.systemAccountDN = try container.decode(String.self, forKey: .systemAccountDN)
        self.systemAccountPassword = try container.decode(String.self, forKey: .systemAccountPassword)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case authenticationURL
        case  baseStructure
        case connectTimeout
        case identifyingAttribute
        case lambdaConfiguration
        case loginIdAttribute
        case readTimeout
        case requestedAttributes
        case securityMethod
        case systemAccountDN
        case systemAccountPassword
    }
}
