//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorEnableDisableSendRequest:Codable{
   
    public var email:String? = nil
    public var method:String? = nil
    public var methodId:String? = nil
    public var mobilePhone:String? = nil
    
    public init(email: String? = nil, method: String? = nil, methodId: String? = nil, mobilePhone:String? = nil) {
         self.email = email
         self.method = method
         self.methodId = methodId
         self.mobilePhone = mobilePhone
     }
}
