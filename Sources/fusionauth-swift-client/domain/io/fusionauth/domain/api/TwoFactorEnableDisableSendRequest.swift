//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorEnableDisableSendRequest:Codable{
   
    public var email:String?
    public var method:String?
    public var methodId:String?
    public var mobilePhone:String?
    
    public init(email: String? = nil, method: String? = nil, methodId: String? = nil, mobilePhone:String? = nil) {
         self.email = email
         self.method = method
         self.methodId = methodId
         self.mobilePhone = mobilePhone
     }
}
