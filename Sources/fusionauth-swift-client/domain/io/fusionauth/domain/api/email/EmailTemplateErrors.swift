//
//  EmailTemplateErrors.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class EmailTemplateErrors:Codable{
    public var parseErrors:[String:String]? = nil
    public var renderErrors:[String:String]? = nil


    public init(parseErrors: [String:String]? = nil, renderErrors: [String:String]? = nil) {
        self.parseErrors = parseErrors
        self.renderErrors = renderErrors
    }
}
