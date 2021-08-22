//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/1/20.
//

import Foundation

public struct ApplicationEmailConfiguration:Codable{
    public var emailUpdateEmailTemplateId:UUID?
    public var emailVerificationEmailTemplateId:UUID?
    public var emailVerifiedEmailTemplateId:UUID?
    public var forgotPasswordEmailTemplateId:UUID?
    public var loginIdInUseOnCreateEmailTemplateId:UUID?
    public var loginIdInUseOnUpdateEmailTemplateId:UUID?
    public var loginNewDeviceEmailTemplateId:UUID?
    public var loginSuspiciousEmailTemplateId:UUID?
    public var passwordResetSuccessEmailTemplateId:UUID?
    public var passwordUpdateEmailTemplateId:UUID?
    public var passwordlessEmailRemplateId:UUID?
    public var setPasswordEmailTemplateId:UUID?
    public var twoFactorMethodAddEmailTemplateId:UUID?
    public var twoFactorMethodRemoveEmailTemplateId:UUID?

    public init(emailUpdateEmailTemplateId: UUID? = nil, emailVerificationEmailTemplateId: UUID? = nil, emailVerifiedEmailTemplateId: UUID? = nil, forgotPasswordEmailTemplateId: UUID? = nil, loginIdInUseOnCreateEmailTemplateId: UUID? = nil, loginIdInUseOnUpdateEmailTemplateId: UUID? = nil, loginNewDeviceEmailTemplateId: UUID? = nil, loginSuspiciousEmailTemplateId: UUID? = nil, passwordResetSuccessEmailTemplateId: UUID? = nil, passwordUpdateEmailTemplateId: UUID? = nil, passwordlessEmailRemplateId: UUID? = nil, setPasswordEmailTemplateId: UUID? = nil, twoFactorMethodAddEmailTemplateId: UUID? = nil, twoFactorMethodRemoveEmailTemplateId: UUID? = nil) {
        self.emailUpdateEmailTemplateId = emailUpdateEmailTemplateId
        self.emailVerificationEmailTemplateId = emailVerificationEmailTemplateId
        self.emailVerifiedEmailTemplateId = emailVerifiedEmailTemplateId
        self.forgotPasswordEmailTemplateId = forgotPasswordEmailTemplateId
        self.loginIdInUseOnCreateEmailTemplateId = loginIdInUseOnCreateEmailTemplateId
        self.loginIdInUseOnUpdateEmailTemplateId = loginIdInUseOnUpdateEmailTemplateId
        self.loginNewDeviceEmailTemplateId = loginNewDeviceEmailTemplateId
        self.loginSuspiciousEmailTemplateId = loginSuspiciousEmailTemplateId
        self.passwordResetSuccessEmailTemplateId = passwordResetSuccessEmailTemplateId
        self.passwordUpdateEmailTemplateId = passwordUpdateEmailTemplateId
        self.passwordlessEmailRemplateId = passwordlessEmailRemplateId
        self.setPasswordEmailTemplateId = setPasswordEmailTemplateId
        self.twoFactorMethodAddEmailTemplateId = twoFactorMethodAddEmailTemplateId
        self.twoFactorMethodRemoveEmailTemplateId = twoFactorMethodRemoveEmailTemplateId
    }
}
