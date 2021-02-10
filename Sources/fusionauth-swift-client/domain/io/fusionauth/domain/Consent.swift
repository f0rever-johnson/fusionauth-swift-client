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

public class Consent:Codable{
    public var consentEmailTemplateId:UUID? = nil
    public var countryMinimumAgeForSelfConsent:LocalizedIntegers? = nil
    public var data:[String:JSONObject]? = nil
    public var defaultMinimumAgeForSelfConsent:Int? = nil
    public var emailPlus:EmailPlus? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var id:UUID? = nil
    public var mutlipleValuesAllowed:Bool? = nil
    public var name:String? = nil
    public var values:[String]? = nil
    
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
