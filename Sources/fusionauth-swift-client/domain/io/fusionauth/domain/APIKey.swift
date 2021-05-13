//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKey:Codable{
    
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var key:String? = nil
    public var keyManager:Bool? = nil
    public var lastUpdateInstant:Date? = nil
    public var metaData:APIKeyMetaData? = nil
    public var permissions:APIKeyPermissions? = nil
    public var tenantId:UUID? = nil
    
    public init(id: UUID? = nil, insertInstant: Date? = nil, key: String? = nil, keyManager: Bool? = nil, lastUpdateInstant: Date? = nil, metaData: APIKeyMetaData? = nil, permissions: APIKeyPermissions? = nil, tenantId: UUID? = nil) {
        self.id = id
        self.insertInstant = insertInstant
        self.key = key
        self.keyManager = keyManager
        self.lastUpdateInstant = lastUpdateInstant
        self.metaData = metaData
        self.permissions = permissions
        self.tenantId = tenantId
    }
}
