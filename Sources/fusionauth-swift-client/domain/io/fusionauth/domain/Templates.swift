//
//  Templates.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct Templates:Codable{
    
    public var emailComplete:String? = nil
    public var emailSend:String? = nil
    public var emailVerify:String? = nil
    public var helpers:String? = nil
    public var oauth2Authorize:String? = nil
    public var oauth2ChildRegistrationNotAllowed:String? = nil
    public var oauth2ChildRegistrationNotAllowedComplete:String? = nil
    public var oauth2CompleteRegistration:String? = nil
    public var oauth2Device:String? = nil
    public var oauth2Error:String? = nil
    public var oauth2Logout:String? = nil
    public var oauth2Passwordless:String? = nil
    public var oauth2Register:String? = nil
    public var oauth2TwoFactor:String? = nil
    public var oauth2Wait:String? = nil
    public var passwordChange:String? = nil
    public var passwordComplete:String? = nil
    public var passwordForgot:String? = nil
    public var passwordSent:String? = nil
    public var registrationComplete:String? = nil
    public var registrationSend:String? = nil
    public var registrationVerify:String? = nil
    public var samlv2Logout:String? = nil

    public init(emailComplete: String? = nil, emailSend: String? = nil, emailVerify: String? = nil, helpers: String? = nil, oauth2Authorize: String? = nil, oauth2ChildRegistrationNotAllowed: String? = nil, oauth2ChildRegistrationNotAllowedComplete: String? = nil, oauth2CompleteRegistration: String? = nil, oauth2Device: String? = nil, oauth2Error: String? = nil, oauth2Logout: String? = nil, oauth2Passwordless: String? = nil, oauth2Register: String? = nil, oauth2TwoFactor: String? = nil, oauth2Wait: String? = nil, passwordChange: String? = nil, passwordComplete: String? = nil, passwordForgot: String? = nil, passwordSent: String? = nil, registrationComplete: String? = nil, registrationSend: String? = nil, registrationVerify: String? = nil, samlv2Logout: String? = nil) {
        self.emailComplete = emailComplete
        self.emailSend = emailSend
        self.emailVerify = emailVerify
        self.helpers = helpers
        self.oauth2Authorize = oauth2Authorize
        self.oauth2ChildRegistrationNotAllowed = oauth2ChildRegistrationNotAllowed
        self.oauth2ChildRegistrationNotAllowedComplete = oauth2ChildRegistrationNotAllowedComplete
        self.oauth2CompleteRegistration = oauth2CompleteRegistration
        self.oauth2Device = oauth2Device
        self.oauth2Error = oauth2Error
        self.oauth2Logout = oauth2Logout
        self.oauth2Passwordless = oauth2Passwordless
        self.oauth2Register = oauth2Register
        self.oauth2TwoFactor = oauth2TwoFactor
        self.oauth2Wait = oauth2Wait
        self.passwordChange = passwordChange
        self.passwordComplete = passwordComplete
        self.passwordForgot = passwordForgot
        self.passwordSent = passwordSent
        self.registrationComplete = registrationComplete
        self.registrationSend = registrationSend
        self.registrationVerify = registrationVerify
        self.samlv2Logout = samlv2Logout
    }
}
