//
//  ChangePasswordResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
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
