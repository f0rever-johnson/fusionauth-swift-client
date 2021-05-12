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

public struct TwilioMessengerConfiguration:BaseMessengerConfigurationProtocol {
    
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertInstant: Date? = nil
    public var lastUpdateInstant: Date? = nil
    public var name: String? = nil
    public var transport: String? = nil
    public var type: MessengerType? = nil
    public var accountSID:String? = nil
    public var authToken:String? = nil
    public var fromPhoneNumber:String? = nil
    public var messagingServiceSid:String? = nil
    public var url:String? = nil
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, accountSID: String? = nil, authToken: String? = nil, fromPhoneNumber: String? = nil, messagingServiceSid: String? = nil, url: String? = nil) {
        self.data = data
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.transport = transport
        self.type = type
        self.accountSID = accountSID
        self.authToken = authToken
        self.fromPhoneNumber = fromPhoneNumber
        self.messagingServiceSid = messagingServiceSid
        self.url = url
    }

}
