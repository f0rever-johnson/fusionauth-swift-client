//
//  Templates.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct Templates:Codable{
    
    public var accountEdit:String?
    public var accountIndex:String?
    public var accountTwoFactorDisable:String?
    public var accountTwoFactorEnable:String?
    public var accountTwoFactorIndex:String?
    public var emailComplete:String?
    public var emailSend:String?
    public var emailSent:String?
    public var emailVerificationRequired:String?
    public var emailVerify:String?
    public var helpers:String?
    public var ident:String?
    public var oauth2Authorize:String?
    public var oauth2AuthorizeNotRegistered:String?
    public var oauth2ChildRegistrationNotAllowed:String?
    public var oauth2ChildRegistrationNotAllowedComplete:String?
    public var oauth2CompleteRegistration:String?
    public var oauth2Device:String?
    public var oauth2Error:String?
    public var oauth2Logout:String?
    public var oauth2Passwordless:String?
    public var oauth2Register:String?
    public var oauth2StartIdPLink:String?
    public var oauth2TwoFactor:String?
    public var oauth2TwoFactorMethods:String?
    public var oauth2Wait:String?
    public var passwordChange:String?
    public var passwordComplete:String?
    public var passwordForgot:String?
    public var passwordSent:String?
    public var registrationComplete:String?
    public var registrationSend:String?
    public var registrationSent:String?
    public var registrationVerificationRequired:String?
    public var registrationVerify:String?
    public var samlv2Logout:String?
    public var unauthorized:String?

    public init(accountEdit: String? = nil, accountIndex: String? = nil, accountTwoFactorDisable: String? = nil, accountTwoFactorEnable: String? = nil, accountTwoFactorIndex: String? = nil, emailComplete: String? = nil, emailSend: String? = nil, emailSent: String? = nil, emailVerificationRequired: String? = nil, emailVerify: String? = nil, helpers: String? = nil, ident: String? = nil, oauth2Authorize: String? = nil, oauth2AuthorizeNotRegistered: String? = nil, oauth2ChildRegistrationNotAllowed: String? = nil, oauth2ChildRegistrationNotAllowedComplete: String? = nil, oauth2CompleteRegistration: String? = nil, oauth2Device: String? = nil, oauth2Error: String? = nil, oauth2Logout: String? = nil, oauth2Passwordless: String? = nil, oauth2Register: String? = nil, oauth2StartIdPLink: String? = nil, oauth2TwoFactor: String? = nil, oauth2TwoFactorMethods: String? = nil, oauth2Wait: String? = nil, passwordChange: String? = nil, passwordComplete: String? = nil, passwordForgot: String? = nil, passwordSent: String? = nil, registrationComplete: String? = nil, registrationSend: String? = nil, registrationSent: String? = nil, registrationVerificationRequired: String? = nil, registrationVerify: String? = nil, samlv2Logout: String? = nil, unauthorized: String? = nil) {
        self.accountEdit = accountEdit
        self.accountIndex = accountIndex
        self.accountTwoFactorDisable = accountTwoFactorDisable
        self.accountTwoFactorEnable = accountTwoFactorEnable
        self.accountTwoFactorIndex = accountTwoFactorIndex
        self.emailComplete = emailComplete
        self.emailSend = emailSend
        self.emailSent = emailSent
        self.emailVerificationRequired = emailVerificationRequired
        self.emailVerify = emailVerify
        self.helpers = helpers
        self.ident = ident
        self.oauth2Authorize = oauth2Authorize
        self.oauth2AuthorizeNotRegistered = oauth2AuthorizeNotRegistered
        self.oauth2ChildRegistrationNotAllowed = oauth2ChildRegistrationNotAllowed
        self.oauth2ChildRegistrationNotAllowedComplete = oauth2ChildRegistrationNotAllowedComplete
        self.oauth2CompleteRegistration = oauth2CompleteRegistration
        self.oauth2Device = oauth2Device
        self.oauth2Error = oauth2Error
        self.oauth2Logout = oauth2Logout
        self.oauth2Passwordless = oauth2Passwordless
        self.oauth2Register = oauth2Register
        self.oauth2StartIdPLink = oauth2StartIdPLink
        self.oauth2TwoFactor = oauth2TwoFactor
        self.oauth2TwoFactorMethods = oauth2TwoFactorMethods
        self.oauth2Wait = oauth2Wait
        self.passwordChange = passwordChange
        self.passwordComplete = passwordComplete
        self.passwordForgot = passwordForgot
        self.passwordSent = passwordSent
        self.registrationComplete = registrationComplete
        self.registrationSend = registrationSend
        self.registrationSent = registrationSent
        self.registrationVerificationRequired = registrationVerificationRequired
        self.registrationVerify = registrationVerify
        self.samlv2Logout = samlv2Logout
        self.unauthorized = unauthorized
    }
}
