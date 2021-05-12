//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public enum TOTPAlgorithm:String, Codable{
    case HmacSHA1
    case HmacSHA256
    case HmacSHA512
}
