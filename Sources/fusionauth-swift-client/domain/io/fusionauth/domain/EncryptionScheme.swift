//
//  EncryptionScheme.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum EncryptionScheme:String, Codable{
    case salted_md5 = "salted-md5"
    case salted_sha256 = "salted-sha256"
    case salted_hmac_sha256 = "salted-hmac-sha256"
    case salted_pbkdf2_hmac_sha256 = "salted-pbkdf2-hmac-sha256"
    case bcrypt = "bcrypt"


    private enum CodingKeys:String, CodingKey{
        case salted_md5 = "salted-md5"
        case salted_sha256 = "salted-sha256"
        case salted_hmac_sha256 = "salted-hmac-sha256"
        case salted_pbkdf2_hmac_sha256 = "salted-pbkdf2-hmac-sha256"
        case bcrypt = "bcrypt"
    }

}
