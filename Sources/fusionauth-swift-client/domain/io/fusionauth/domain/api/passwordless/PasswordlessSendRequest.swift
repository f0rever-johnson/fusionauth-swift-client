//
//  PasswordlessSendRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct PasswordlessSendRequest:Codable{
    public var applicationId:UUID? = nil
    public var code:String? = nil
    public var loginId:String? = nil
    public var state:[String:JSONObject]? = nil

    public init(applicationId: UUID? = nil, code: String? = nil, loginId: String? = nil, state: [String:JSONObject]? = nil) {
        self.applicationId = applicationId
        self.code = code
        self.loginId = loginId
        self.state = state
    }

}
