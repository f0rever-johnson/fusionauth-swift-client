//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorMethod:Codable{
    
    public var autenticator:AuthenticatorConfiguration? = nil
    public var email:String? = nil
    public var id:String? = nil
    public var lastUsed:Bool? = nil
    public var method:String? = nil
    public var mobilePhone:String? = nil
    public var secret:String? = nil
    
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
