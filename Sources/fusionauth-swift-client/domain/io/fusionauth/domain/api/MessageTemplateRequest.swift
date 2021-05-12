//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MessageTemplateRequest:Codable{
    
    public var messageTemplate:MessageTemplate? = nil
    
    public init(messageTemplate: MessageTemplate? = nil) {
        self.messageTemplate = messageTemplate
    }
    
}
