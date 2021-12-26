//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorEmailTemplate:Codable{
    public var templateId:UUID?
    
    public init(templateId: UUID? = nil) {
        self.templateId = templateId
    }
}
