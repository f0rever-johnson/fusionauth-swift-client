//
//  SecureIdentity.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public protocol SecureIdentity:Codable{
    var encryptionScheme:EncryptionScheme? { get }
    var factor:Int? { get }
    var id:UUID? { get }
    var password:String? { get }
    var passwordChangeRequired:Bool? { get }
    var passwordLastUpdateInstant:Date? { get }
    var salt:String? { get }
    var verified:Bool? { get }
}
