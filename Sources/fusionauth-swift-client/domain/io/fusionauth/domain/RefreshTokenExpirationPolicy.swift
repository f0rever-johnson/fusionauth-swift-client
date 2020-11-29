//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public enum RefreshTokenExpirationPolicy:String, Codable{
    case Fixed
    case SlidingWindow
}
