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
    public var id:UUID? = nil
    public var active:Bool? = nil
    public var authenticationTokenConfiguration:AuthenticationTokenConfiguration? = nil
    public var cleanSpeakConfiguration:CleanSpeakConfiguration? = nil
    public var data:JSONObject? = nil
    public var jwtConfiguration:JWTConfiguration? = nil
    public var name:String? = nil
    public var oauthConfiguration:OAuth2Configuration? = nil
    public var roles:[ApplicationRole]? = nil
    public var tenantId:UUID? = nil
    public var verificationEmailTemplateId:UUID? = nil
    public var verifyRegistration:Bool? = nil
    public var lambdaConfiguration:LambdaConfiguration? = nil

    public init(id: UUID? = nil, active: Bool? = nil, authenticationTokenConfiguration: AuthenticationTokenConfiguration? = nil, cleanSpeakConfiguration: CleanSpeakConfiguration? = nil, data: JSONObject? = nil, jwtConfiguration: JWTConfiguration? = nil, name: String? = nil, oauthConfiguration: OAuth2Configuration? = nil, roles: [ApplicationRole]? = nil, tenantId: UUID? = nil, verificationEmailTemplateId: UUID? = nil, verifyRegistration: Bool? = nil, lambdaConfiguration: LambdaConfiguration? = nil) {
        self.id = id
        self.active = active
        self.authenticationTokenConfiguration = authenticationTokenConfiguration
        self.cleanSpeakConfiguration = cleanSpeakConfiguration
        self.data = data
        self.jwtConfiguration = jwtConfiguration
        self.name = name
        self.oauthConfiguration = oauthConfiguration
        self.roles = roles
        self.tenantId = tenantId
        self.verificationEmailTemplateId = verificationEmailTemplateId
        self.verifyRegistration = verifyRegistration
        self.lambdaConfiguration = lambdaConfiguration
    }

}

