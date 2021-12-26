//
//  UserActionReason.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Action Reason Object
 */

public class UserActionReason:Codable {

    public var code:String?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var localizedTexts:LocalizedStrings?
    public var text:String?

    public init(code: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, localizedTexts: LocalizedStrings? = nil, text: String? = nil) {
        self.code = code
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.localizedTexts = localizedTexts
        self.text = text
    }
}


