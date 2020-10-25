//
//  PasswordlessStartRequest.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
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
