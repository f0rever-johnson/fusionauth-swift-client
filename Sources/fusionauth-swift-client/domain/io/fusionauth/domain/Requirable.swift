//
//  Requireable.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Requirable:Enableable, Codable {
    public var enabled: Bool?
    
    public var required:Bool?

    public init(enabled: Bool?, required: Bool?) {
        self.enabled = enabled
        self.required = required
    }
    
}

