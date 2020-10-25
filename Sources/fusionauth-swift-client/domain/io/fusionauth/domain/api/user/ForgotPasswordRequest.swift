//
//  ForgotPasswordRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class ForgotPasswordRequest:Codable {
    public var changePasswordId:String? = nil
    public var email:String? = nil
    public var loginId:String? = nil
    public var sendForgotPasswordEmail:Bool? = nil
    public var state:[String:JSONObject]? = nil
    public var username:String? = nil

    public init(changePasswordId: String? = nil, email: String? = nil, loginId: String? = nil, sendForgotPasswordEmail: Bool? = nil, state: [String:JSONObject]? = nil, username: String? = nil) {
        self.changePasswordId = changePasswordId
        self.email = email
        self.loginId = loginId
        self.sendForgotPasswordEmail = sendForgotPasswordEmail
        self.state = state
        self.username = username
    }
}
