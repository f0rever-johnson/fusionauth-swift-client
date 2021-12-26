//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKeyRequest:Codable{
 
    public var apiKey:APIKey?
    public var sourceKeyId:UUID?
    
    public init(apiKey: APIKey? = nil, sourceKeyId: UUID? = nil) {
        self.apiKey = apiKey
        self.sourceKeyId = sourceKeyId
    }
}
