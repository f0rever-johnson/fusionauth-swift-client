//
//  EmailTemplateResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EmailTemplateResponse:Codable {
    public var emailTemplate:EmailTemplate? = nil
    public var emailTemplates:[EmailTemplate]? = nil


    public init(emailTemplate: EmailTemplate? = nil, emailTemplates: [EmailTemplate]? = nil) {
        self.emailTemplate = emailTemplate
        self.emailTemplates = emailTemplates
    }
}
