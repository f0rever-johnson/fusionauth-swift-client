//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public class IdentityProviderLinkRequest:BaseEventRequest{

    public var displayName:String?
    public var identityProviderId:UUID?
    public var identityProviderUserId:UUID?
    public var pendingIdPLinkId:String?
    public var userId:UUID?
    
    public init(displayName: String? = nil, eventInfo:EventInfo? = nil, identityProviderId: UUID? = nil, identityProviderUserId: UUID? = nil, pendingIdPLinkId: String? = nil, userId: UUID? = nil) {
        self.displayName = displayName
        self.identityProviderId = identityProviderId
        self.identityProviderUserId = identityProviderUserId
        self.pendingIdPLinkId = pendingIdPLinkId
        self.userId = userId
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.identityProviderId = try container.decode(UUID.self, forKey: .identityProviderId)
        self.identityProviderUserId = try container.decode(UUID.self, forKey: .identityProviderUserId)
        self.pendingIdPLinkId = try container.decode(String.self, forKey: .pendingIdPLinkId)
        self.userId = try container.decode(UUID.self, forKey: .userId)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(displayName, forKey: .displayName)
        try container.encode(identityProviderId, forKey: .identityProviderId)
        try container.encode(identityProviderUserId, forKey: .identityProviderUserId)
        try container.encode(pendingIdPLinkId, forKey: .pendingIdPLinkId)
        try container.encode(userId, forKey: .userId)
            
        try super.encode(to: encoder)
    }
    
    
    public enum CodingKeys:CodingKey{
        case displayName
        case identityProviderId
        case identityProviderUserId
        case pendingIdPLinkId
        case userId
    }
                                
}
