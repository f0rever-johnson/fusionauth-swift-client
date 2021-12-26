//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormResponse:Codable{
    public var form:Form?
    public var forms:[Form]?
    
    public init(form: Form? = nil, forms: [Form]? = nil) {
        self.form = form
        self.forms = forms
    }

}
