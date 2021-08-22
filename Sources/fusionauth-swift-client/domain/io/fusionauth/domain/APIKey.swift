//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKey:Codable{
    
    public var id:UUID?
    public var insertInstant:Date?
    public var ipAccessControlListId:UUID?
    public var key:String?
    public var keyManager:Bool?
    public var lastUpdateInstant:Date?
    public var metaData:APIKeyMetaData?
    public var permissions:APIKeyPermissions?
    public var tenantId:UUID? 
    
    public init(id: UUID? = nil, insertInstant: Date? = nil, ipAccessControlListId: UUID? = nil, key: String? = nil, keyManager: Bool? = nil, lastUpdateInstant: Date? = nil, metaData: APIKeyMetaData? = nil, permissions: APIKeyPermissions? = nil, tenantId: UUID? = nil) {
        self.id = id
        self.insertInstant = insertInstant
        self.ipAccessControlListId = ipAccessControlListId
        self.key = key
        self.keyManager = keyManager
        self.lastUpdateInstant = lastUpdateInstant
        self.metaData = metaData
        self.permissions = permissions
        self.tenantId = tenantId
    }

}
