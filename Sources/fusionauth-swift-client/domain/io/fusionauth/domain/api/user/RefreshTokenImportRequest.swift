//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class RefreshTokenImportRequest:Codable{
    public var refreshTokens:[RefreshToken]?
    public var validateDbConstraints:Bool?
    
    public init(refreshTokens: [RefreshToken]? = nil, validateDbConstraints: Bool? = nil) {
        self.refreshTokens = refreshTokens
        self.validateDbConstraints = validateDbConstraints
    }
    
}
