//
//  UserDeleteRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 1/24/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public class UserDeleteRequest:BaseEventRequest {

    
    public var dryRun:Bool?
    public var hardDelete:Bool?
    public var query:String?
    public var queryString:String?
    public var userIds:[UUID]?

    
    public init(dryRun: Bool? = nil, eventInfo: EventInfo? = nil, hardDelete: Bool? = nil, query: String? = nil, queryString: String? = nil, userIds: [UUID]? = nil) {
        self.dryRun = dryRun
        self.hardDelete = hardDelete
        self.query = query
        self.queryString = queryString
        self.userIds = userIds
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dryRun = try container.decode(Bool.self, forKey: .dryRun)
        self.hardDelete = try container.decode(Bool.self, forKey: .hardDelete)
        self.query = try container.decode(String.self, forKey: .query)
        self.queryString = try container.decode(String.self, forKey: .queryString)
        self.userIds = try container.decode([UUID].self, forKey: .userIds)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case dryRun
        case hardDelete
        case query
        case queryString
        case userIds
    }
}
