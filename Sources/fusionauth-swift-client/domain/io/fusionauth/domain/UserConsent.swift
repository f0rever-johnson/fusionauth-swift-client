//
//  UserConsent.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class UserConsent:Codable{
    
    public var consent:Consent?
    public var consentId:UUID?
    public var data:[String:JSONObject]?
    public var giverUserId:UUID?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var status:ConsentStatus?
    public var userId:UUID?
    public var values:[String]?


    public init(consent: Consent? = nil, consentId: UUID? = nil, data: [String:JSONObject]? = nil, giverUserId: UUID? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, status: ConsentStatus? = nil, userId: UUID? = nil, values: [String]? = nil) {
        self.consent = consent
        self.consentId = consentId
        self.data = data
        self.giverUserId = giverUserId
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.status = status
        self.userId = userId
        self.values = values
    }
}
