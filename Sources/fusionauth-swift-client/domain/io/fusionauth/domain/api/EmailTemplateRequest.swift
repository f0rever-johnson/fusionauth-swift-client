//
//  EmailTemplateRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EmailTemplateRequest:Codable {
    public var emailTemplate:EmailTemplate? = nil

    public init(emailTemplate: EmailTemplate? = nil) {
        self.emailTemplate = emailTemplate
    }

}
