//
//  LDAPSecurityMethod.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum LDAPSecurityMethod:String, Codable {
    case None = "None"
    case LDAPS = "LDAPS"
    case StartTLS = "StartTLS"
    
}
