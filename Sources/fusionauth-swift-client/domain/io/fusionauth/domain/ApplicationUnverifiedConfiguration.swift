//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class ApplicationUnverifiedConfiguration:Codable{

    public var registration:UnverifiedBehavior? = nil
    public var verificationStrategy:VerificationStrategy? = nil
    public var whenGated:RegistrationUnverifiedOptions? = nil
    
    public init(registration: UnverifiedBehavior? = nil, verificationStrategy: VerificationStrategy? = nil, whenGated: RegistrationUnverifiedOptions? = nil) {
        self.registration = registration
        self.verificationStrategy = verificationStrategy
        self.whenGated = whenGated
    }
}
