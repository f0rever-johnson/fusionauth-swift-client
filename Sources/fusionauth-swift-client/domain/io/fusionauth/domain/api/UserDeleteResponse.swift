//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class UserDeleteResponse:Codable{
 
    public var dryRun:Bool?
    public var hardDelete:Bool?
    public var total:Int?
    public var userIds:[String]?
    
    public init(dryRun: Bool? = nil, hardDelete: Bool? = nil, total: Int? = nil, userIds: [String]? = nil) {
        self.dryRun = dryRun
        self.hardDelete = hardDelete
        self.total = total
        self.userIds = userIds
    }
    
    
}
