//
//  TwilioConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Twilio Configuration Object.
 */

public struct TwilioConfiguration:Enableable, Codable {
    public var enabled: Bool? = nil
    public var accountSID:String? = nil
    public var authToken:String? = nil
    public var fromPhoneNumber:String? = nil
    public var messagingServiceSid:String? = nil
    public var url:String? = nil

    public init(enabled: Bool? = nil, accountSID: String? = nil, authToken: String? = nil, fromPhoneNumber: String? = nil, messagingServiceSid: String? = nil, url: String? = nil) {
        self.enabled = enabled
        self.accountSID = accountSID
        self.authToken = authToken
        self.fromPhoneNumber = fromPhoneNumber
        self.messagingServiceSid = messagingServiceSid
        self.url = url
    }

}
