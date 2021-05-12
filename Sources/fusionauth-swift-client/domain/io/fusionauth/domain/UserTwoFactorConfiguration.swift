//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class UserTwoFactorConfiguration:Codable{
 
    public var methods:[TwoFactorMethod]? = nil
    public var recoveryCodes:[String]? = nil
    
    public init(methods: [TwoFactorMethod]? = nil, recoveryCodes: [String]? = nil) {
        self.methods = methods
        self.recoveryCodes = recoveryCodes
    }
}
