//
//  SendResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class SendResponse:Codable{

    public var anonymousResults:[String:EmailTemplateErrors]?
    public var results:[UUID:EmailTemplateErrors]?

    public init(anonymousResults: [String : EmailTemplateErrors]? = nil, results: [UUID : EmailTemplateErrors]? = nil) {
        self.anonymousResults = anonymousResults
        self.results = results
    }
}
