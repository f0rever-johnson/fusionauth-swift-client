//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserTwoFactorMethodRemoveEvent:BaseEvent{
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var method:TwoFactorMethod?
    public var user:User?

    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, method: TwoFactorMethod? = nil, user: User? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.method = method
        self.user = user
    }
}
