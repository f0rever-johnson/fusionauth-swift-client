//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorMethod:Codable{
    
    public var autenticator:AuthenticatorConfiguration?
    public var email:String?
    public var id:String?
    public var lastUsed:Bool?
    public var method:String?
    public var mobilePhone:String?
    public var secret:String?
    
    public init(autenticator: AuthenticatorConfiguration? = nil, email: String? = nil, id: String? = nil, lastUsed: Bool? = nil, method: String? = nil, mobilePhone: String? = nil, secret: String? = nil) {
        self.autenticator = autenticator
        self.email = email
        self.id = id
        self.lastUsed = lastUsed
        self.method = method
        self.mobilePhone = mobilePhone
        self.secret = secret
    }
}
