//
//  LoginResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct LoginResponse:Codable {
    
    public var actions:[LoginPreventedResponse]? = nil
    public var changePasswordId:String? = nil
    public var changePasswordReason:ChangePasswordReason? = nil
    public var emailVerificationId:String? = nil
    public var methods:[TwoFactorMethod]? = nil
    public var pendingIdPLinkId:String? = nil
    public var refreshToken:String? = nil
    public var registrationVerificationId:String? = nil
    public var state:[String:JSONObject]? = nil
    public var threatsDetected:[AuthenticationThreats]
    public var token:String? = nil
    public var twoFactorId:String? = nil
    public var twoFactorTrustId:String? = nil
    public var user:User? = nil
    
    public init(actions: [LoginPreventedResponse]? = nil, changePasswordId: String? = nil, changePasswordReason: ChangePasswordReason? = nil, emailVerificationId: String? = nil, methods: [TwoFactorMethod]? = nil, pendingIdPLinkId: String? = nil, refreshToken: String? = nil, registrationVerificationId: String? = nil, state: [String : JSONObject]? = nil, threatsDetected: [AuthenticationThreats], token: String? = nil, twoFactorId: String? = nil, twoFactorTrustId: String? = nil, user: User? = nil) {
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
        self.twoFactorId = twoFactorId
        self.twoFactorTrustId = twoFactorTrustId
        self.user = user
    }
    
}
