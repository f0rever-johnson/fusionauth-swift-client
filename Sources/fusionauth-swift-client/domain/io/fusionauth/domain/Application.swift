//
//  Application.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Application Object.
 */

public struct Application:Codable{
    
    public var accessControlConfiguration:ApplicationAccessControlConfiguration?
    public var active:Bool?
    public var authenticationTokenConfiguration:AuthenticationTokenConfiguration?
    public var cleanSpeakConfiguration:CleanSpeakConfiguration?
    public var data:[String:JSONObject]?
    public var emailConfiguration:ApplicationEmailConfiguration?
    public var externalIdentifierConfiguration:ApplicationExternalIdentifierConfiguration?
    public var formConfiguration:ApplicationFormConfiguration?
    public var id:UUID?
    public var insertInstant:Date?
    public var jwtConfiguration:JWTConfiguration?
    public var lambdaConfiguration:LambdaConfiguration?
    public var lastUpdateInstant:Date?
    public var loginConfiguration:LoginConfiguration?
    public var miltiFactorConfiguration:ApplicationMultiFactorConfiguration?
    public var name:String? 
    public var oauthConfiguration:OAuth2Configuration?
    public var passwordlessConfiguration:PasswordlessConfiguration?
    public var registrationConfiguration:RegistrationConfiguration?
    public var registrationDeletePolicy:ApplicationRegistrationDeletePolicy?
    public var roles:[ApplicationRole]?
    public var samlv2Configuration:SAMLV2Configuration?
    public var state:ObjectState?
    public var tenantId:UUID?
    public var themeId:UUID?
    public var unverified:RegistrationUnverifiedOptions?
    public var verificationEmailTemplateId:UUID?
    public var verificationStrategy:VerificationStrategy?
    public var verifyRegistration:Bool?
    
    public init(accessControlConfiguration: ApplicationAccessControlConfiguration? = nil, active: Bool? = nil, authenticationTokenConfiguration: AuthenticationTokenConfiguration? = nil, cleanSpeakConfiguration: CleanSpeakConfiguration? = nil, data: [String : JSONObject]? = nil, emailConfiguration: ApplicationEmailConfiguration? = nil, externalIdentifierConfiguration: ApplicationExternalIdentifierConfiguration? = nil, formConfiguration: ApplicationFormConfiguration? = nil, id: UUID? = nil, insertInstant: Date? = nil, jwtConfiguration: JWTConfiguration? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, loginConfiguration: LoginConfiguration? = nil, miltiFactorConfiguration: ApplicationMultiFactorConfiguration? = nil, name: String? = nil, oauthConfiguration: OAuth2Configuration? = nil, passwordlessConfiguration: PasswordlessConfiguration? = nil, registrationConfiguration: RegistrationConfiguration? = nil, registrationDeletePolicy: ApplicationRegistrationDeletePolicy? = nil, roles: [ApplicationRole]? = nil, samlv2Configuration: SAMLV2Configuration? = nil, state: ObjectState? = nil, tenantId: UUID? = nil, themeId: UUID? = nil, unverified: RegistrationUnverifiedOptions? = nil, verificationEmailTemplateId: UUID? = nil, verificationStrategy: VerificationStrategy? = nil, verifyRegistration: Bool? = nil) {
        self.accessControlConfiguration = accessControlConfiguration
        self.active = active
        self.authenticationTokenConfiguration = authenticationTokenConfiguration
        self.cleanSpeakConfiguration = cleanSpeakConfiguration
        self.data = data
        self.emailConfiguration = emailConfiguration
        self.externalIdentifierConfiguration = externalIdentifierConfiguration
        self.formConfiguration = formConfiguration
        self.id = id
        self.insertInstant = insertInstant
        self.jwtConfiguration = jwtConfiguration
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.loginConfiguration = loginConfiguration
        self.miltiFactorConfiguration = miltiFactorConfiguration
        self.name = name
        self.oauthConfiguration = oauthConfiguration
        self.passwordlessConfiguration = passwordlessConfiguration
        self.registrationConfiguration = registrationConfiguration
        self.registrationDeletePolicy = registrationDeletePolicy
        self.roles = roles
        self.samlv2Configuration = samlv2Configuration
        self.state = state
        self.tenantId = tenantId
        self.themeId = themeId
        self.unverified = unverified
        self.verificationEmailTemplateId = verificationEmailTemplateId
        self.verificationStrategy = verificationStrategy
        self.verifyRegistration = verifyRegistration
    }
    
    
}

