//
//  EmailTemplateRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct EmailTemplateRequest:Codable {
    public var emailTemplate:EmailTemplate?

    public init(emailTemplate: EmailTemplate? = nil) {
        self.emailTemplate = emailTemplate
    }

}
