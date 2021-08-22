//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation



public enum ReactorFeatureStatus:String, Codable {
    case active = "ACTIVE"
    case disconnected = "DISCONNECTED"
    case pending = "PENDING"
    case disabled = "DISABLED"
    case unknown = "UNKNOWN"
}
