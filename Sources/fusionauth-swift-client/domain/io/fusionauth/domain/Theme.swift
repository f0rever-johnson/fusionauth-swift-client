//
//  Theme.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class Theme:Codable{
    public var data:[String:JSONObject]? = nil
    public var defaultMessages:String? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var localizedMessages:LocalizedStrings? = nil
    public var name:String? = nil
    public var stylesheet:String? = nil
    public var templates:Templates? = nil

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
