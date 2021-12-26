//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorSMSMethod:Enableable, Codable{
    public var enabled:Bool?
    public var templateId:UUID?
    
    public init(enabled: Bool? = nil, templateId: UUID? = nil) {
        self.enabled = enabled
        self.templateId = templateId
    }
}
