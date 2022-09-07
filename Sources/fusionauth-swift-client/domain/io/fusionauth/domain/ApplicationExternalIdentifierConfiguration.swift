//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/30/22.
//

import Foundation

public class ApplicationExternalIdentifierConfiguration:Codable{

    public var twoFactorTrustIdTimeToLiveInSeconds:Int?
    
    public init(twoFactorTrustIdTimeToLiveInSeconds: Int? = nil) {
        self.twoFactorTrustIdTimeToLiveInSeconds = twoFactorTrustIdTimeToLiveInSeconds
    }
}
