//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class SMSMessage:Codable{
    
    public var phoneNumer:String?
    public var textMessage:String?
    
    public init(phoneNumer: String? = nil, textMessage: String? = nil) {
        self.phoneNumer = phoneNumer
        self.textMessage = textMessage
    }
}
