//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormFieldResponse:Codable{
    public var field:FormField?
    public var fields:[FormField]?
    
    public init(field: FormField? = nil, fields: [FormField]? = nil) {
        self.field = field
        self.fields = fields
    }
}
