//
//  EmailSecurityType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public enum EmailSecurityType:String,Codable{
    case NONE = "NONE"
    case SSL = "SSL"
    case TLS = "TLS"
}
