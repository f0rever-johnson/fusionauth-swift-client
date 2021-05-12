//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MultiFactorEmailMethod:Enableable, Codable{

    public var enabled: Bool? = nil
    public var templateId:UUID? = nil
    
    public init(enabled: Bool? = nil, templateId: UUID? = nil) {
        self.enabled = enabled
        self.templateId = templateId
    }
}
