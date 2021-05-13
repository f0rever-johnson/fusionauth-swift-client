//
//  EmailConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

/**
 * Creates a new Email Configuration Object.
 */

public struct EmailConfiguration:Codable{
    
    public var defaultFromEmail:String? = nil
    public var defaultFromName:String? = nil
    public var forgotPasswordEmailTemplateId:UUID? = nil
    public var host:String? = nil
    public var password:String? = nil
    public var passwordlessEmailTemplateId:UUID? = nil
    public var port:Int? = nil
    public var properties:String? = nil
    public var security:EmailSecurityType? = nil
    public var setPasswordEmailTemplateId:UUID? = nil
    public var unverified:EmailUnverifiedOptions? = nil
    public var username:String? = nil
    public var verificationEmailTemplateId:UUID? = nil
    public var verificationStrategy:VerificationStrategy? = nil
    public var verifyEmail:Bool? = nil
    public var verifyEmailWhenChanged:Bool? = nil
    
    public init(defaultFromEmail: String? = nil, defaultFromName: String? = nil, forgotPasswordEmailTemplateId: UUID? = nil, host: String? = nil, password: String? = nil, passwordlessEmailTemplateId: UUID? = nil, port: Int? = nil, properties: String? = nil, security: EmailSecurityType? = nil, setPasswordEmailTemplateId: UUID? = nil, unverified: EmailUnverifiedOptions? = nil, username: String? = nil, verificationEmailTemplateId: UUID? = nil, verificationStrategy: VerificationStrategy? = nil, verifyEmail: Bool? = nil, verifyEmailWhenChanged: Bool? = nil) {
        self.defaultFromEmail = defaultFromEmail
        self.defaultFromName = defaultFromName
        self.forgotPasswordEmailTemplateId = forgotPasswordEmailTemplateId
        self.host = host
        self.password = password
        self.passwordlessEmailTemplateId = passwordlessEmailTemplateId
        self.port = port
        self.properties = properties
        self.security = security
        self.setPasswordEmailTemplateId = setPasswordEmailTemplateId
        self.unverified = unverified
        self.username = username
        self.verificationEmailTemplateId = verificationEmailTemplateId
        self.verificationStrategy = verificationStrategy
        self.verifyEmail = verifyEmail
        self.verifyEmailWhenChanged = verifyEmailWhenChanged
    }

    
}



