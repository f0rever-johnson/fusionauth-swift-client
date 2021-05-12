//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class AuthenticatorConfiguration:Codable{
 
    public var algorithm:TOTPAlgorithm? = nil
    public var codeLength:Int? = nil
    public var timeStep:Int? = nil
    
    public init(algorithm: TOTPAlgorithm? = nil, codeLength: Int? = nil, timeStep: Int? = nil) {
        self.algorithm = algorithm
        self.codeLength = codeLength
        self.timeStep = timeStep
    }
}
