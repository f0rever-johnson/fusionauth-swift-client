//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public enum ClientAuthenticationPolicy:String, Codable{
    case Required = "Required"
    case NotRequired = "NotRequired"
    case NotRequiredWhenUsingPKCE = "NotRequiredWhenUsingPKCE"
}
