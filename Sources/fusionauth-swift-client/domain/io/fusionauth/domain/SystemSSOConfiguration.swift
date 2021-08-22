//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public class SystemSSOConfiguration:Codable{

    public var deviceTrustTimeToLIveInSeconds:Int?
    
    public init(deviceTrustTimeToLIveInSeconds: Int? = nil) {
        self.deviceTrustTimeToLIveInSeconds = deviceTrustTimeToLIveInSeconds
    }
}
