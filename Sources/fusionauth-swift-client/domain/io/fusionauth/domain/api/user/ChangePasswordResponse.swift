//
//  ChangePasswordResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct ChangePasswordResponse:Codable{
    public var oneTimePassword:String? = nil
    public var state:[String:JSONObject]? = nil

    public init(oneTimePassword: String? = nil, state: [String:JSONObject]? = nil) {
        self.oneTimePassword = oneTimePassword
        self.state = state
    }

}
