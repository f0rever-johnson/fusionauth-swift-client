//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MessageTemplateResponse:Codable{
    
    public var messageTemplate:MessageTemplate?
    public var messageTemplates:[MessageTemplate]?
    
    public init(messageTemplate: MessageTemplate? = nil, messageTemplates: [MessageTemplate]? = nil) {
        self.messageTemplate = messageTemplate
        self.messageTemplates = messageTemplates
    }
}
