//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class PreviewMessageTemplateResponse:Codable{
 
    public var errors:Errors? = nil
    public var message:SMSMessage? = nil
    
    public init(errors: Errors? = nil, message: SMSMessage? = nil) {
        self.errors = errors
        self.message = message
    }
}
