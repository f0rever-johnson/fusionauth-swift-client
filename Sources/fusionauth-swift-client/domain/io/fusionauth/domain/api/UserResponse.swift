//
//  UserResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserResponse:Codable {
 
    public var emailVerificationId:String?
    public var registrationVerificationIds:[String:String]?
    public var token:String?
    public var tokenExpirationInstant:Date?
    public var user:User?
    public var users:[User]?
    
    public init(emailVerificationId: String? = nil, registrationVerificationIds: [String : String]? = nil, token: String? = nil, tokenExpirationInstant: Date? = nil, user: User? = nil, users: [User]? = nil) {
        self.emailVerificationId = emailVerificationId
        self.registrationVerificationIds = registrationVerificationIds
        self.token = token
        self.tokenExpirationInstant = tokenExpirationInstant
        self.user = user
        self.users = users
    }

}
