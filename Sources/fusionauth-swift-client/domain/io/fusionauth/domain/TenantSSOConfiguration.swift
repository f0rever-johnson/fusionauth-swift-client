//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 12/22/21.
//

import Foundation

public class TenantSSOConfiguration:Codable{
  
    public deviceTrustTimeToLiveInSeconds:Int?
    
    public init(deviceTrustTimeToLiveInSeconds: Int? = nil) {
        self.deviceTrustTimeToLiveInSeconds = deviceTrustTimeToLiveInSeconds
    }
}
