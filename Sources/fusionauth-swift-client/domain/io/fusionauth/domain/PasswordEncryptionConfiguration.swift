//
//  PasswordEncryptionConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Password Encryption Configuration Object.
 */

public class PasswordEncryptionConfiguration:Codable {
    public var encryptionScheme:String?
    public var encryptionSchemeFactor:Int?
    public var modifyEncryptionSchemeOnLogin:Bool?


    public init(encryptionScheme: String? = nil, encryptionSchemeFactor: Int? = nil, modifyEncryptionSchemeOnLogin: Bool? = nil) {
        self.encryptionScheme = encryptionScheme
        self.encryptionSchemeFactor = encryptionSchemeFactor
        self.modifyEncryptionSchemeOnLogin = modifyEncryptionSchemeOnLogin
    }
}
