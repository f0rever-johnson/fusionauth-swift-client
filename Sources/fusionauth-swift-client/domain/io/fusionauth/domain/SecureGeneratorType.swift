//
//  SecureGeneratorType.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public enum SecureGeneratorType:String, Codable{
    
    case randomDigits = "randomDigits"
    case randomBytes = "randomBytes"
    case randomAlpha = "randomAlpha"
    case randomAlphaNumeric = "randomAlphaNumeric"
    
}
