//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public enum UniqueUsernameStrategy:String, Codable{
    case always = "Always"
    case onCollision = "OnCollision"
}
