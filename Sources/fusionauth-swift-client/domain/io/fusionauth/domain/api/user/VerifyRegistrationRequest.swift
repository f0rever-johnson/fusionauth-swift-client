//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class VerifyRegistrationRequest:BaseEventRequest{

    public var oneTimeCode:String? = nil
    public var verificationId:String? = nil
    
    public init(eventInfo: EventInfo? = nil, oneTimeCode: String? = nil, verificationId: String? = nil) {
        self.oneTimeCode = oneTimeCode
        self.verificationId = verificationId
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.oneTimeCode = try container.decode(String.self, forKey: .oneTimeCode)
        self.verificationId = try container.decode(String.self, forKey: .verificationId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    private enum CodingKeys:CodingKey{
        case oneTimeCode
        case verificationId
    }
}
