//
//  UserConsent.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class UserConsent:Codable{
    
    public var consent:Consent? = nil
    public var consentId:UUID? = nil
    public var data:[String:JSONObject]? = nil
    public var giverUserId:UUID? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var status:ConsentStatus? = nil
    public var userId:UUID? = nil
    public var values:[String]? = nil


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
