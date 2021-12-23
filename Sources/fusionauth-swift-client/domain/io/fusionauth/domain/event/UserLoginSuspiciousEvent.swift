//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserLoginSuspiciousEvent:UserLoginSuccessEvent{
    public var threatsDetected:[AuthenticationThreats]?


    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, authenticationType: String? = nil, identityProviderId: UUID? = nil, identityProviderName: String? = nil, ipAddress: String? = nil, user: User? = nil, threatsDetected: [AuthenticationThreats]? = nil) {
        self.threatsDetected = threatsDetected
        super.init(info: info, type: type, id: id, tenantId: tenantId, applicationId: applicationId, authenticationType: authenticationType, identityProviderId: identityProviderId, identityProviderName: identityProviderName, ipAddress: ipAddress, user: user)
    }

    public required init(from decoder: Decoder) throws {

        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.threatsDetected = try container.decode([AuthenticationThreats].self, forKey: .threatsDetected)


        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)

    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(threatsDetected, forKey: .threatsDetected)

        try super.encode(to: encoder)
    }

    private enum CodingKeys:CodingKey{
        case threatsDetected

    }
}
