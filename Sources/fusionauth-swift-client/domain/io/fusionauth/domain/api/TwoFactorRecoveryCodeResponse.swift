//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorRecoveryCodeResponse:Codable{
  
    public var recoveryCodes:[String]? = nil
    
    public init(recoveryCodes: [String]? = nil) {
        self.recoveryCodes = recoveryCodes
    }
    
}
