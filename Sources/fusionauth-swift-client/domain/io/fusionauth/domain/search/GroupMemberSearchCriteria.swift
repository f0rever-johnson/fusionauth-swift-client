//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class GroupMemberSearchCriteria:Codable{
 
    public var groupId:UUID?
    public var tenantId:UUID?
    public var userId:UUID?
    
    public init(groupId: UUID? = nil, tenantId:UUID? = nil, userId: UUID? = nil) {
        self.groupId = groupId
        self.tenantId = tenantId
        self.userId = userId
    }
}
