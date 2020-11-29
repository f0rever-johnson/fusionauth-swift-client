//
//  PreviewRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct PreviewRequest:Codable {
    public var emailTemplate:EmailTemplate? = nil
    public var locale:Locale? = nil

    public init(emailTemplate: EmailTemplate? = nil, locale: Locale? = nil) {
        self.emailTemplate = emailTemplate
        self.locale = locale
    }

}
