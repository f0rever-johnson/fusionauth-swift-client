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

    public var forgotPasswordEmailTemplateId:UUID? = nil
    public var host:String? = nil
    public var password:String? = nil
    public var passwordlessEmailTemplateId:UUID? = nil
    public var port:Int? = nil
    public var properties:String? = nil
    public var security:EmailSecurityType? = nil
    public var setPasswordEmailTemplateId:UUID? = nil
    public var username:String? = nil
    public var verifyEmail:Bool? = nil
    public var verifyEmailWhenChanged:Bool? = nil
    public var verificationEmailTemplateId:UUID? = nil

    public init(forgotPasswordEmailTemplateId: UUID? = nil, host: String? = nil, password: String? = nil, passwordlessEmailTemplateId: UUID? = nil, port: Int? = nil, properties: String? = nil, security: EmailSecurityType? = nil, setPasswordEmailTemplateId: UUID? = nil, username: String? = nil, verifyEmail: Bool? = nil, verifyEmailWhenChanged: Bool? = nil, verificationEmailTemplateId: UUID? = nil) {
        self.forgotPasswordEmailTemplateId = forgotPasswordEmailTemplateId
        self.host = host
        self.password = password
        self.passwordlessEmailTemplateId = passwordlessEmailTemplateId
        self.port = port
        self.properties = properties
        self.security = security
        self.setPasswordEmailTemplateId = setPasswordEmailTemplateId
        self.username = username
        self.verifyEmail = verifyEmail
        self.verifyEmailWhenChanged = verifyEmailWhenChanged
        self.verificationEmailTemplateId = verificationEmailTemplateId
    }

}



