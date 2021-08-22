//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class TwoFactorDisableRequest:BaseEventRequest{
    public var applicationId:UUID?
    public var code:String?
    public var methodId:String?
    
    public init(applicationId:UUID? = nil, code: String? = nil, eventInfo: EventInfo? = nil, methodId: String? = nil) {
        self.applicationId = applicationId
        self.code = code
        self.methodId = methodId
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(UUID.self, forKey: .applicationId)
        self.code = try container.decode(String.self, forKey: .code)
        self.methodId = try container.decode(String.self, forKey: .methodId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case code
        case methodId
    }
}
