//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public enum BreachedPasswordStatus:String, Codable {
    case None
    case ExactMatch
    case SubAddressMatch
    case PasswordOnly
    case CommonPassword
}
