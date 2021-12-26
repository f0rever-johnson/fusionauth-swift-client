//
//  EmailTemplate.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class EmailTemplate:Codable{
    public var defaultFromName:String?
    public var defaultHtmlTemplate:String?
    public var defaultSubject:String?
    public var defaultTextTemplate:String?
    public var fromEmail:String?
    public var id: UUID?
    public var localizedFromNames:LocalizedStrings?
    public var localizedHTMLTemplates:LocalizedStrings?
    public var localizedSubjects:LocalizedStrings?
    public var localizedTextTemplates:LocalizedStrings?
    public var name:String?

    public init(defaultFromName: String? = nil, defaultHtmlTemplate: String? = nil, defaultSubject: String? = nil, defaultTextTemplate: String? = nil, fromEmail: String? = nil, id: UUID? = nil, localizedFromNames: LocalizedStrings? = nil, localizedHTMLTemplates: LocalizedStrings? = nil, localizedSubjects: LocalizedStrings? = nil, localizedTextTemplates: LocalizedStrings? = nil, name: String? = nil) {
        self.defaultFromName = defaultFromName
        self.defaultHtmlTemplate = defaultHtmlTemplate
        self.defaultSubject = defaultSubject
        self.defaultTextTemplate = defaultTextTemplate
        self.fromEmail = fromEmail
        self.id = id
        self.localizedFromNames = localizedFromNames
        self.localizedHTMLTemplates = localizedHTMLTemplates
        self.localizedSubjects = localizedSubjects
        self.localizedTextTemplates = localizedTextTemplates
        self.name = name
    }

}
