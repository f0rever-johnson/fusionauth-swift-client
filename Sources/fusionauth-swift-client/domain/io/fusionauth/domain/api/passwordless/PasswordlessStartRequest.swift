//
//  PasswordlessStartRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/11/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class PasswordlessStartRequest:Codable{
    public var applicationId:UUID?
    public var loginId:String?
    public var state:[String:JSONObject]?

    public init(applicationId: UUID? = nil, loginId: String? = nil, state: [String:JSONObject]? = nil) {
        self.applicationId = applicationId
        self.loginId = loginId
        self.state = state
    }

}
