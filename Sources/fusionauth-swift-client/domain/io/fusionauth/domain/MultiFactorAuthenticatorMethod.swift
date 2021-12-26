//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorAuthenticatorMethod:Enableable, Codable{
    
    public var enabled: Bool?
    public var algoritm:TOTPAlgorithm?
    public var codelength:Int?
    public var timestep:Int?
    
    public init(enabled: Bool? = nil, algoritm: TOTPAlgorithm? = nil, codelength: Int? = nil, timestep: Int? = nil) {
        self.enabled = enabled
        self.algoritm = algoritm
        self.codelength = codelength
        self.timestep = timestep
    }
    
    
    
}
