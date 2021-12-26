//
//  Theme.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class Theme:Codable{
    public var data:[String:JSONObject]?
    public var defaultMessages:String?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var localizedMessages:LocalizedStrings?
    public var name:String?
    public var stylesheet:String?
    public var templates:Templates?

    public init(data: [String:JSONObject]? = nil, defaultMessages: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, localizedMessages: LocalizedStrings? = nil, name: String? = nil, stylesheet: String? = nil, templates: Templates? = nil) {
        self.data = data
        self.defaultMessages = defaultMessages
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.localizedMessages = localizedMessages
        self.name = name
        self.stylesheet = stylesheet
        self.templates = templates
    }

}
