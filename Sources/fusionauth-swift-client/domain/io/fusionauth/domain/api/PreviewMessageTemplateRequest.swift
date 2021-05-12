//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class PreviewMessageTemplateRequest:Codable{
   
    public var lacale:String? = nil
    public var messageTemplate:MessageTemplate? = nil
    
    public init(lacale: String? = nil, messageTemplate: MessageTemplate? = nil) {
         self.lacale = lacale
         self.messageTemplate = messageTemplate
     }
}
