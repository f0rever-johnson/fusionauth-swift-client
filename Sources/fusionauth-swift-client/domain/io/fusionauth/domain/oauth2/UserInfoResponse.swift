//
//  UserInfoResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class UserInfoResponse:Codable{
    public var UserInfoResponse:[String:JSONObject]?

    public init(UserInfoResponse: [String:JSONObject]? = nil) {
        self.UserInfoResponse = UserInfoResponse
    }
}
