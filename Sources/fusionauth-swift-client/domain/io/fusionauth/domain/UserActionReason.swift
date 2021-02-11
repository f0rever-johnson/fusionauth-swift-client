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

    public var code:String? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var localizedTexts:LocalizedStrings? = nil
    public var text:String? = nil

    public init(code: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, localizedTexts: LocalizedStrings? = nil, text: String? = nil) {
        self.code = code
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.localizedTexts = localizedTexts
        self.text = text
    }
}


