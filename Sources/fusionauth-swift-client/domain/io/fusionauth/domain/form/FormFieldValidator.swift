//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormFieldValidator:Codable{
    public var expression:String? = nil
    
    public init(expression: String? = nil) {
        self.expression = expression
    }
}
