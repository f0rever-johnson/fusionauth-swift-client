//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class ApplicationUnverifiedConfiguration:Codable{

    public var registration:UnverifiedBehavior?
    public var verificationStrategy:VerificationStrategy?
    public var whenGated:RegistrationUnverifiedOptions?   
    
    public init(registration: UnverifiedBehavior? = nil, verificationStrategy: VerificationStrategy? = nil, whenGated: RegistrationUnverifiedOptions? = nil) {
        self.registration = registration
        self.verificationStrategy = verificationStrategy
        self.whenGated = whenGated
    }
}
