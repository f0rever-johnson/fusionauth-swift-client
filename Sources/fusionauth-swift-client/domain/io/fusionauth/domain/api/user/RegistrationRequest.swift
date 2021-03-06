//
//  RegistrationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct RegistrationRequest:Codable {
    public var generateAuthenticationToken:Bool? = nil
    public var registration:UserRegistration? = nil
    public var sendSetPasswordEmail:Bool? = nil
    public var skipRegistrationVerification:Bool? = nil
    public var skipVerification:Bool? = nil
    public var user:User? = nil

    public init(generateAuthenticationToken: Bool? = nil, registration: UserRegistration? = nil, sendSetPasswordEmail: Bool? = nil, skipRegistrationVerification: Bool? = nil, skipVerification: Bool? = nil, user: User? = nil) {
        self.generateAuthenticationToken = generateAuthenticationToken
        self.registration = registration
        self.sendSetPasswordEmail = sendSetPasswordEmail
        self.skipRegistrationVerification = skipRegistrationVerification
        self.skipVerification = skipVerification
        self.user = user
    }

}
