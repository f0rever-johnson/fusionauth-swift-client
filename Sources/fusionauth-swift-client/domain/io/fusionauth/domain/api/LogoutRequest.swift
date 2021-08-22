//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct LogoutRequest:Codable{
    
    public var global:Bool?
    public var refreshToken:String?
    
    public init(global: Bool? = nil, refreshToken: String? = nil) {
        self.global = global
        self.refreshToken = refreshToken
    }
}
