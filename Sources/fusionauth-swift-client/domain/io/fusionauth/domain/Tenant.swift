//
//  Tenant.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Tenant Object.
 */

public struct Tenant:Codable{

    public var accessControlConfiguration:TenantAccessControlConfiguration?
    public var captchaConfiguration:TenantCaptchaConfiguration?
    public var configured:Bool?
    public var connectorPolicies:[ConnectorPolicy]?
    public var data: [String:JSONObject]?
    public var emailConfiguration:EmailConfiguration?
    public var eventConfiguration:EventConfiguration?
    public var externalIdentifierConfiguration:ExternalIdentifierConfiguration?
    public var failedAuthenticationConfiguration:FailedAuthenticationConfiguration?
    public var familyConfiguration:FamilyConfiguration?
    public var formConfiguration:TenantFormConfiguration?
    public var httpSessionMaxInactiveInterval:Int?
    public var id:UUID?
    public var insertInstant:Date?
    public var issuer:String?
    public var jwtConfiguration:JWTConfiguration?
    public var lastUpdateInstant:Date?
    public var loginConfiguration:TenantLoginConfiguration?
    public var logoutURL:String?
    public var maximumPasswordAge:MaximumPasswordAge?
    public var minimumPasswordAge:MinimumPasswordAge?
    public var multiFactorConfiguration:TenantMultiFactorConfiguration?
    public var name:String?
    public var oauth2Configuration:TenantOauth2Configuration?
    public var passwordEncrytionConfiguration:PasswordEncryptionConfiguration?
    public var passwordValidationRules:PasswordValidationRules?
    public var rateLimitConfiguration:TenantRateLimitConfiguration?
    public var registrationConfiguration:TenantRegistrationConfiguration?
    public var state:ObjectState?
    public var themeId:UUID?
    public var userDeletePolicy:TenantUserDeletePolicy?
    public var usernameConfiguration:TenantUsernameConfiguration?

    
}

