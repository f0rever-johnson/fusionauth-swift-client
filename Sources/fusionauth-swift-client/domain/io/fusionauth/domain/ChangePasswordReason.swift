//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public enum ChangePasswordReason:String, Codable{
    case Admistrative
    case Breached
    case Expired
    case Validation
}
