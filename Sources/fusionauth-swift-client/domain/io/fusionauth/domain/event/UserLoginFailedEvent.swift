//
//  UserLoginFailedEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserLoginFailedEvent:BaseEvent,Codable{

    
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var applicationId:UUID?
    public var authenticationType:String?
    public var ipAddress:String?
    public var user:User?


    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, authenticationType: String? = nil, ipAddress: String? = nil, user: User? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.authenticationType = authenticationType
        self.ipAddress = ipAddress
        self.user = user
    }


}
