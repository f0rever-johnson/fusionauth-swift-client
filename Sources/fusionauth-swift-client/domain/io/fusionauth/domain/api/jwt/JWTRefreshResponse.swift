//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/18/21.
//

import Foundation

public class JWTRefreshResponse:Codable{
   
    public var refreshToken:String?
    public var token:String?
    
    public init(refreshToken: String? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.token = token
    }
}
