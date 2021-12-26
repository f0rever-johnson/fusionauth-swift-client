//
//  EmailTemplateErrors.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/9/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class EmailTemplateErrors:Codable{
    public var parseErrors:[String:String]?
    public var renderErrors:[String:String]?


    public init(parseErrors: [String:String]? = nil, renderErrors: [String:String]? = nil) {
        self.parseErrors = parseErrors
        self.renderErrors = renderErrors
    }
}
