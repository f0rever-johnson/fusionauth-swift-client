//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorResponse:Codable{
    
    public var recoveryCodes:[String]?
    
    public init(recoveryCodes: [String]? = nil) {
        self.recoveryCodes = recoveryCodes
    }
    
}
