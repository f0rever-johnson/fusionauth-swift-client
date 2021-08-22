//
//  BaseLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class BaseLoginRequest:BaseEventRequest{
    
    public var applicationId:UUID?
    public var ipAddress:String?
    public var metaData:MetaData?
    public var newDevice:Bool?
    public var noJWT:Bool?
    
    public init(applicationId: UUID? = nil, eventInfo: EventInfo? = nil, ipAddress: String? = nil, metaData: MetaData? = nil, newDevice: Bool? = nil, noJWT: Bool? = nil) {
        self.applicationId = applicationId
        self.ipAddress = ipAddress
        self.metaData = metaData
        self.newDevice = newDevice
        self.noJWT = noJWT
        super.init(eventInfo: eventInfo)
    }
    
  
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        applicationId = try container.decode(UUID.self, forKey: .applicationId)
        ipAddress = try container.decode(String.self, forKey: .ipAddress)
        metaData = try container.decode(MetaData.self, forKey: .metaData)
        newDevice = try container.decode(Bool.self, forKey: .newDevice)
        noJWT = try container.decode(Bool.self, forKey: .noJWT)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)

    }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case ipAddress
        case metaData
        case newDevice
        case noJWT
    }
}
