//
//  PasswordlessStartRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/11/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class PasswordlessStartRequest:Codable{
    public var applicationId:UUID? = nil
    public var loginId:String? = nil
    public var state:[String:JSONObject]? = nil

    public init(applicationId: UUID? = nil, loginId: String? = nil, state: [String:JSONObject]? = nil) {
        self.applicationId = applicationId
        self.loginId = loginId
        self.state = state
    }

}
