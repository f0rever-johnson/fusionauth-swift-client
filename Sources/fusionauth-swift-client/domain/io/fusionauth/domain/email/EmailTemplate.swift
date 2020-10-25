//
//  EmailTemplate.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class EmailTemplate:Codable{
    public var defaultFromName:String? = nil
    public var defaultHtmlTemplate:String? = nil
    public var defaultSubject:String? = nil
    public var defaultTextTemplate:String? = nil
    public var fromEmail:String? = nil
    public var id: UUID? = nil
    public var localizedFromNames:LocalizedStrings? = nil
    public var localizedHTMLTemplates:LocalizedStrings? = nil
    public var localizedSubjects:LocalizedStrings? = nil
    public var localizedTextTemplates:LocalizedStrings? = nil
    public var name:String? = nil

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
