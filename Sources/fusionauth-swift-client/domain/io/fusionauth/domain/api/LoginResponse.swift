//
//  LoginResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct LoginResponse:Codable {
    public var actions:[LoginPreventedResponse]? = nil
    public var changePasswordId:String? = nil
    public var refreshToken:String? = nil
    public var state:[String:JSONObject]? = nil
    public var token:String? = nil
    public var twoFactorId:String? = nil
    public var twoFactorTrustId:String? = nil
    public var user:User? = nil

    public init(actions: [LoginPreventedResponse]? = nil, changePasswordId: String? = nil, refreshToken: String? = nil, state: [String:JSONObject]? = nil, token: String? = nil, twoFactorId: String? = nil, twoFactorTrustId: String? = nil, user: User? = nil) {
        self.actions = actions
        self.changePasswordId = changePasswordId
        self.refreshToken = refreshToken
        self.state = state
        self.token = token
        self.twoFactorId = twoFactorId
        self.twoFactorTrustId = twoFactorTrustId
        self.user = user
    }

}
