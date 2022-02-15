//
//  LoginResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct LoginResponse:Codable {
    
    public var actions:[LoginPreventedResponse]?
    public var changePasswordId:String?
    public var changePasswordReason:ChangePasswordReason?
    public var emailVerificationId:String?
    public var methods:[TwoFactorMethod]?
    public var pendingIdPLinkId:String?
    public var refreshToken:String?
    public var registrationVerificationId:String?
    public var state:[String:JSONObject]?
    public var threatsDetected:[AuthenticationThreats]?
    public var token:String?
    public var tokenExpirationInstant:Date?
    public var trustToken:String?
    public var twoFactorId:String?
    public var twoFactorTrustId:String?
    public var user:User?
    
    public init(actions: [LoginPreventedResponse]? = nil, changePasswordId: String? = nil, changePasswordReason: ChangePasswordReason? = nil, emailVerificationId: String? = nil, methods: [TwoFactorMethod]? = nil, pendingIdPLinkId: String? = nil, refreshToken: String? = nil, registrationVerificationId: String? = nil, state: [String : JSONObject]? = nil, threatsDetected: [AuthenticationThreats]? = nil, token: String? = nil, tokenExpirationInstant: Date? = nil, trustToken: String? = nil, twoFactorId: String? = nil, twoFactorTrustId: String? = nil, user: User? = nil) {
        self.actions = actions
        self.changePasswordId = changePasswordId
        self.changePasswordReason = changePasswordReason
        self.emailVerificationId = emailVerificationId
        self.methods = methods
        self.pendingIdPLinkId = pendingIdPLinkId
        self.refreshToken = refreshToken
        self.registrationVerificationId = registrationVerificationId
        self.state = state
        self.threatsDetected = threatsDetected
        self.token = token
        self.tokenExpirationInstant = tokenExpirationInstant
        self.trustToken = trustToken
        self.twoFactorId = twoFactorId
        self.twoFactorTrustId = twoFactorTrustId
        self.user = user
    }
}
