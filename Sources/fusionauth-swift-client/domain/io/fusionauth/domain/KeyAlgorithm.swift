//
//  KeyAlgorithm.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum KeyAlgorithm:String, Codable{
    
    case ES256 = "SHA256withECDSA"
    case ES384 = "SHA384withECDSA"
    case ES512 = "SHA512withECDSA"
    case HS256 = "HmacSHA256"
    case HS384 = "HmacSHA384"
    case HS512 = "HmacSHA512"
    case RS256 = "SHA256withRSA"
    case RS384 = "SHA384withRSA"
    case RS512 = "SHA512withRSA"
    
}
