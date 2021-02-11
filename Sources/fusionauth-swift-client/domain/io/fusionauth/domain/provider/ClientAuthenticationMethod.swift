//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public enum ClientAuthenticationMethod: String, Codable{
    case none = "none"
    case clientSecretBasic = "client_secret_basic"
    case clientSecretPost = " client_secret_post"
}
