//
//  RegistrationResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class RegistrationResponse:Codable{

    public var registration:UserRegistration?
    public var registrationVerificationId:String?
    public var token:String?
    public var user:User?
    
    public init(registration: UserRegistration? = nil, registrationVerificationId: String? = nil, token: String? = nil, user: User? = nil) {
        self.registration = registration
        self.registrationVerificationId = registrationVerificationId
        self.token = token
        self.user = user
    }

}
