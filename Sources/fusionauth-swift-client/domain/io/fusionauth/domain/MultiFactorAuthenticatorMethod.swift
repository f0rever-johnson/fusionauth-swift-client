//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorAuthenticatorMethod:Enableable, Codable{
    
    public var enabled: Bool? = nil
    public var algoritm:TOTPAlgorithm? = nil
    public var codelength:Int? = nil
    public var timestep:Int? = nil
    
    public init(enabled: Bool? = nil, algoritm: TOTPAlgorithm? = nil, codelength: Int? = nil, timestep: Int? = nil) {
        self.enabled = enabled
        self.algoritm = algoritm
        self.codelength = codelength
        self.timestep = timestep
    }
    
    
    
}
