//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormStep:Codable{
    public var fields:[UUID]? = nil
    
    public init(fields: [UUID]? = nil) {
        self.fields = fields
    }
}
