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

    public var active:Bool? = nil
    public var authenticationTokenConfiguration:AuthenticationTokenConfiguration? = nil
    public var cleanSpeakConfiguration:CleanSpeakConfiguration? = nil
    public var data:[String:JSONObject]? = nil
    public var emailConfiguration:ApplicationEmailConfiguration? = nil
    public var formConfiguration:ApplicationFormConfiguration? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var jwtConfiguration:JWTConfiguration? = nil
    public var lambdaConfiguration:LambdaConfiguration? = nil
    public var lastUpdateInstant:Date? = nil
    public var loginConfiguration:LoginConfiguration? = nil
    public var miltiFactorConfiguration:ApplicationMultiFactorConfiguration? = nil
    public var name:String? = nil
    public var oauthConfiguration:OAuth2Configuration? = nil
    public var passwordlessConfiguration:PasswordlessConfiguration? = nil
    public var registrationConfiguration:RegistrationConfiguration? = nil
    public var registrationDeletePolicy:ApplicationRegistrationDeletePolicy? = nil
    public var roles:[ApplicationRole]? = nil
    public var samlv2Configuration:SAMLV2Configuration? = nil
    public var state:ObjectState? = nil
    public var tenantId:UUID? = nil
    public var verificationEmailTemplateId:UUID? = nil
    public var verifyRegistration:Bool? = nil
    
    public init(active: Bool? = nil, authenticationTokenConfiguration: AuthenticationTokenConfiguration? = nil, cleanSpeakConfiguration: CleanSpeakConfiguration? = nil, data: [String : JSONObject]? = nil, emailConfiguration: ApplicationEmailConfiguration? = nil, formConfiguration: ApplicationFormConfiguration? = nil, id: UUID? = nil, insertInstant: Date? = nil, jwtConfiguration: JWTConfiguration? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, loginConfiguration: LoginConfiguration? = nil, miltiFactorConfiguration: ApplicationMultiFactorConfiguration? = nil, name: String? = nil, oauthConfiguration: OAuth2Configuration? = nil, passwordlessConfiguration: PasswordlessConfiguration? = nil, registrationConfiguration: RegistrationConfiguration? = nil, registrationDeletePolicy: ApplicationRegistrationDeletePolicy? = nil, roles: [ApplicationRole]? = nil, samlv2Configuration: SAMLV2Configuration? = nil, state: ObjectState? = nil, tenantId: UUID? = nil, verificationEmailTemplateId: UUID? = nil, verifyRegistration: Bool? = nil) {
        self.active = active
        self.authenticationTokenConfiguration = authenticationTokenConfiguration
        self.cleanSpeakConfiguration = cleanSpeakConfiguration
        self.data = data
        self.emailConfiguration = emailConfiguration
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
        self.verificationEmailTemplateId = verificationEmailTemplateId
        self.verifyRegistration = verifyRegistration
    }
    
    
}

