//
//  UserResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserResponse:Codable {

    public var emailVerificationId:String? = nil
    public var registrationVerificationIds:[String:String]? = nil
    public var token:String? = nil
    public var user:User? = nil
    public var users:[User]? = nil
    
    public init(emailVerificationId: String? = nil, registrationVerificationIds: [String : String]? = nil, token: String? = nil, user: User? = nil, users: [User]? = nil) {
        self.emailVerificationId = emailVerificationId
        self.registrationVerificationIds = registrationVerificationIds
        self.token = token
        self.user = user
        self.users = users
    }

}
