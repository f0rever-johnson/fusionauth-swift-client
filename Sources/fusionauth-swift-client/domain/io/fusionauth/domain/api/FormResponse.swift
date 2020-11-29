//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormResponse:Codable{
    public var form:Form? = nil
    public var forms:[Form]? = nil
    
    public init(form: Form? = nil, forms: [Form]? = nil) {
        self.form = form
        self.forms = forms
    }

}
