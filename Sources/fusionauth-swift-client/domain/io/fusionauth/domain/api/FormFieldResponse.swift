//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormFieldReponse:Codable{
    public var field:FormField? = nil
    public var fields:[FormField]? = nil
    
    public init(field: FormField? = nil, fields: [FormField]? = nil) {
        self.field = field
        self.fields = fields
    }
}
