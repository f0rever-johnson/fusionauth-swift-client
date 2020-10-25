//
//  PreviewRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
