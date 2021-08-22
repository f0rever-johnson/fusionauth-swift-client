//
//  ContentStatus.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Content Status Options.
 */

public enum ContentStatus:String,Codable{
    case Active = "ACTIVE"
    case Pending = "PENDING"
    case Rejected = "REJECTED"
}
