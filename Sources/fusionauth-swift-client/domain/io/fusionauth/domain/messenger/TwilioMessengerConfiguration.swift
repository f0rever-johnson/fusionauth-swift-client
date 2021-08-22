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

public class TwilioMessengerConfiguration:BaseMessengerConfiguration {

    public var accountSID:String? = nil
    public var authToken:String? = nil
    public var fromPhoneNumber:String? = nil
    public var messagingServiceSid:String? = nil
    public var url:String? = nil
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, accountSID: String? = nil, authToken: String? = nil, fromPhoneNumber: String? = nil, messagingServiceSid: String? = nil, url: String? = nil) {
  
        self.accountSID = accountSID
        self.authToken = authToken
        self.fromPhoneNumber = fromPhoneNumber
        self.messagingServiceSid = messagingServiceSid
        self.url = url
        super.init(data: data, debug: debug, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, transport: transport, type: type)
    }
    
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountSID = try container.decode(String.self, forKey: .accountSID)
        self.authToken = try container.decode(String.self, forKey: .authToken)
        self.fromPhoneNumber = try container.decode(String.self, forKey: .fromPhoneNumber)
        self.messagingServiceSid = try container.decode(String.self, forKey: .messagingServiceSID)
        self.url = try container.decode(String.self, forKey: .url)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    public enum CodingKeys:CodingKey{
        case accountSID
        case authToken
        case fromPhoneNumber
        case messagingServiceSID
        case url
    }

}
