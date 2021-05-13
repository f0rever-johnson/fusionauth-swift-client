//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKeyResponse:Codable{

    public var apiKey:APIKey? = nil
    
    public init(apiKey: APIKey? = nil) {
        self.apiKey = apiKey
    }
}
