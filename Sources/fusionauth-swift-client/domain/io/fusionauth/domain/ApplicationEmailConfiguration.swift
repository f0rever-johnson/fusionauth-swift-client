//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/1/20.
//

import Foundation

public class ApplicationEmailConfiguration:Codable{
    public var emailVerificationEmailTemplateId:UUID?
    public var forgotPasswordEmailTemplateId:UUID?
    public var passwordlessEmailRemplateId:UUID?
    public var setPasswordEmailTemplateID:UUID?

    public init(emailVerificationEmailTemplateId: UUID?, forgotPasswordEmailTemplateId: UUID?, passwordlessEmailRemplateId: UUID?, setPasswordEmailTemplateID: UUID?) {
        self.emailVerificationEmailTemplateId = emailVerificationEmailTemplateId
        self.forgotPasswordEmailTemplateId = forgotPasswordEmailTemplateId
        self.passwordlessEmailRemplateId = passwordlessEmailRemplateId
        self.setPasswordEmailTemplateID = setPasswordEmailTemplateID
    }
}
