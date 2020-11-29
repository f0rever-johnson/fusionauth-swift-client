//
//  SendResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class SendResponse:Codable{
    public var results:[UUID:EmailTemplateErrors]? = nil

    public init(results: [UUID:EmailTemplateErrors]? = nil) {
        self.results = results
    }

}
