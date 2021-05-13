//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class TenantUnverifiedConfiguration:Codable{

    public var email:UnverifiedBehavior? = nil
    public var whenGated:RegistrationUnverifiedOptions? = nil
    
    public init(email: UnverifiedBehavior? = nil, whenGated: RegistrationUnverifiedOptions? = nil) {
        self.email = email
        self.whenGated = whenGated
    }
}
