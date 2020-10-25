//
//  RegistrationResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class RegistrationResponse:Codable{
    public var registration:UserRegistration? = nil
    public var user:User? = nil

    public init(registration: UserRegistration? = nil, user: User? = nil) {
        self.registration = registration
        self.user = user
    }

}
