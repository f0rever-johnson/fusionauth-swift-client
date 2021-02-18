//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/18/21.
//

import Foundation

public class JWTRefreshResponse:Codable{
   
    public var refreshToken:String? = nil
    public var token:String? = nil
    
    public init(refreshToken: String? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.token = token
    }
}
