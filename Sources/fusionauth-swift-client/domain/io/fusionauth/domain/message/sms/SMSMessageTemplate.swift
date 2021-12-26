//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class SMSMessageTemplate:MessageTemplate{
    
    public var defaultTemplate:String?
    public var localizedTemplates:LocalizedStrings?
    
    public init(data: [String : JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: MessageType? = nil, defaultTemplate: String? = nil, localizedTemplates: LocalizedStrings? = nil) {
        self.defaultTemplate = defaultTemplate
        self.localizedTemplates = localizedTemplates
        super.init(data: data, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, type:type)
    }

    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.defaultTemplate = try container.decode(String.self, forKey: .defaultTemplate)
        self.localizedTemplates = try container.decode(LocalizedStrings.self, forKey: .localizedTemplates)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(defaultTemplate, forKey: .defaultTemplate)
        try container.encode(localizedTemplates, forKey: .localizedTemplates)
        
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case defaultTemplate
        case localizedTemplates
    }








}
