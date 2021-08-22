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
    
    public var defaultFromEmail:String?
    public var defaultFromName:String?
    public var emailupdateEmailTemplateId:UUID?
    public var emailVerifiedEmailTemplateId:UUID?
    public var forgotPasswordEmailTemplateId:UUID?
    public var host:String?
    public var loginIdInUseOnCreateEmailTemplateId:UUID?
    public var loginIdInUseOnUpdateEmailTemplateId:UUID?
    public var loginNewDeviceEmailTemplateId:UUID?
    public var loginSuspiciousEmailTemplateId:UUID?
    public var password:String?
    public var passwordResetSuccessEmailTemplateId:UUID?
    public var passwordUpdateEmailTemplateId:UUID?
    public var passwordlessEmailTemplateId:UUID?
    public var port:Int?
    public var properties:String?
    public var security:EmailSecurityType?
    public var setPasswordEmailTemplateId:UUID?
    public var twoFactorMethodAddEmailTemplateId:UUID?
    public var twoFactorMethodRemoveEmailTemplateId:UUID?
    public var unverified:EmailUnverifiedOptions?
    public var username:String? = nil
    public var verificationEmailTemplateId:UUID?
    public var verificationStrategy:VerificationStrategy?
    public var verifyEmail:Bool?
    public var verifyEmailWhenChanged:Bool?
    
    public init(defaultFromEmail: String? = nil, defaultFromName: String? = nil, emailupdateEmailTemplateId: UUID? = nil, emailVerifiedEmailTemplateId: UUID? = nil, forgotPasswordEmailTemplateId: UUID? = nil, host: String? = nil, loginIdInUseOnCreateEmailTemplateId: UUID? = nil, loginIdInUseOnUpdateEmailTemplateId: UUID? = nil, loginNewDeviceEmailTemplateId: UUID? = nil, loginSuspiciousEmailTemplateId: UUID? = nil, password: String? = nil, passwordResetSuccessEmailTemplateId: UUID? = nil, passwordUpdateEmailTemplateId: UUID? = nil, passwordlessEmailTemplateId: UUID? = nil, port: Int? = nil, properties: String? = nil, security: EmailSecurityType? = nil, setPasswordEmailTemplateId: UUID? = nil, twoFactorMethodAddEmailTemplateId: UUID? = nil, twoFactorMethodRemoveEmailTemplateId: UUID? = nil, unverified: EmailUnverifiedOptions? = nil, username: String? = nil, verificationEmailTemplateId: UUID? = nil, verificationStrategy: VerificationStrategy? = nil, verifyEmail: Bool? = nil, verifyEmailWhenChanged: Bool? = nil) {
        self.defaultFromEmail = defaultFromEmail
        self.defaultFromName = defaultFromName
        self.emailupdateEmailTemplateId = emailupdateEmailTemplateId
        self.emailVerifiedEmailTemplateId = emailVerifiedEmailTemplateId
        self.forgotPasswordEmailTemplateId = forgotPasswordEmailTemplateId
        self.host = host
        self.loginIdInUseOnCreateEmailTemplateId = loginIdInUseOnCreateEmailTemplateId
        self.loginIdInUseOnUpdateEmailTemplateId = loginIdInUseOnUpdateEmailTemplateId
        self.loginNewDeviceEmailTemplateId = loginNewDeviceEmailTemplateId
        self.loginSuspiciousEmailTemplateId = loginSuspiciousEmailTemplateId
        self.password = password
        self.passwordResetSuccessEmailTemplateId = passwordResetSuccessEmailTemplateId
        self.passwordUpdateEmailTemplateId = passwordUpdateEmailTemplateId
        self.passwordlessEmailTemplateId = passwordlessEmailTemplateId
        self.port = port
        self.properties = properties
        self.security = security
        self.setPasswordEmailTemplateId = setPasswordEmailTemplateId
        self.twoFactorMethodAddEmailTemplateId = twoFactorMethodAddEmailTemplateId
        self.twoFactorMethodRemoveEmailTemplateId = twoFactorMethodRemoveEmailTemplateId
        self.unverified = unverified
        self.username = username
        self.verificationEmailTemplateId = verificationEmailTemplateId
        self.verificationStrategy = verificationStrategy
        self.verifyEmail = verifyEmail
        self.verifyEmailWhenChanged = verifyEmailWhenChanged
    }
    
}



