//
//  EmailTemplateResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
