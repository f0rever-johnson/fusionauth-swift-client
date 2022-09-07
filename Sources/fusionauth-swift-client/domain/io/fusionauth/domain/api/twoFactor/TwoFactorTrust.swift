//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/30/22.
//

import Foundation

public class TwoFactorTrust:Codable{
 
    public var applicationId:UUID?
    public var expiration:Date?
    public var startInstant:Date?
    
    public init(applicationId: UUID? = nil, expiration: Date? = nil, startInstant: Date? = nil) {
        self.applicationId = applicationId
        self.expiration = expiration
        self.startInstant = startInstant
    }
}
