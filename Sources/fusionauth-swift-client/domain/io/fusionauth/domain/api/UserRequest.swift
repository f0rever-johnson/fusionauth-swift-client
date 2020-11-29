//
//  UserRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserRequest:Codable{
    public var sendSetPasswordEmail:Bool? = nil
    public var skipVerification:Bool? = nil
    public var user:User? = nil

    public init(sendSetPasswordEmail: Bool? = nil, skipVerification: Bool? = nil, user: User? = nil) {
        self.sendSetPasswordEmail = sendSetPasswordEmail
        self.skipVerification = skipVerification
        self.user = user
    }
}
