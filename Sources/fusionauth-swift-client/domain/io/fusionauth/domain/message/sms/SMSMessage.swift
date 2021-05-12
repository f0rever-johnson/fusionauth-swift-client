//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class SMSMessage:Codable{
    
    public var phoneNumer:String? = nil
    public var textMessage:String? = nil
    
    public init(phoneNumer: String? = nil, textMessage: String? = nil) {
        self.phoneNumer = phoneNumer
        self.textMessage = textMessage
    }
}
