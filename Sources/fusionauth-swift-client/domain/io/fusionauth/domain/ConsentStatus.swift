//
//  ConsentStatus.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Models a consent
 */

public enum ConsentStatus:String,Codable{
    case active = "ACTIVE"
    case revoked = "REVOKED"
}
