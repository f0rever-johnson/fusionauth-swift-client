//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct JWTVendResponse:Codable{
   
    public var token:String?
    
    public init(token: String? = nil) {
        self.token = token
    }
}
