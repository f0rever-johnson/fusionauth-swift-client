//
//  Consent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Models a consent.
 *
 */

public struct Consent:Codable{
    public var consentEmailTemplateId:UUID?
    public var countryMinimumAgeForSelfConsent:LocalizedIntegers?
    public var data:[String:JSONObject]?
    public var defaultMinimumAgeForSelfConsent:Int?
    public var emailPlus:EmailPlus?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var id:UUID?
    public var mutlipleValuesAllowed:Bool?
    public var name:String?
    public var values:[String]? 
    
    public init(consentEmailTemplateId: UUID? = nil, countryMinimumAgeForSelfConsent: LocalizedIntegers? = nil, data: [String : JSONObject]? = nil, defaultMinimumAgeForSelfConsent: Int? = nil, emailPlus: EmailPlus? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, id: UUID? = nil, mutlipleValuesAllowed: Bool? = nil, name: String? = nil, values: [String]? = nil) {
        self.consentEmailTemplateId = consentEmailTemplateId
        self.countryMinimumAgeForSelfConsent = countryMinimumAgeForSelfConsent
        self.data = data
        self.defaultMinimumAgeForSelfConsent = defaultMinimumAgeForSelfConsent
        self.emailPlus = emailPlus
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.id = id
        self.mutlipleValuesAllowed = mutlipleValuesAllowed
        self.name = name
        self.values = values
    }
}
