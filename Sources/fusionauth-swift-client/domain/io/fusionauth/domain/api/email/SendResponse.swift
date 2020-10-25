//
//  SendResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SendResponse:Codable{
    public var results:[UUID:EmailTemplateErrors]? = nil

    public init(results: [UUID:EmailTemplateErrors]? = nil) {
        self.results = results
    }

}
