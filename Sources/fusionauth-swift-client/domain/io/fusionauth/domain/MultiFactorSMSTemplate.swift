//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorSMSTemplate:Codable{
    public var templateId:UUID? = nil
    
    public init(templateId: UUID? = nil) {
        self.templateId = templateId
    }
}
