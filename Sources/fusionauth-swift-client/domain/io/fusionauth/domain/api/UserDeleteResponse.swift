//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class UserDeleteResponse:Codable{
 
    public var dryRun:Bool? = nil
    public var hardDelete:Bool? = nil
    public var total:Int? = nil
    public var userIds:[String]? = nil
    
    public init(dryRun: Bool? = nil, hardDelete: Bool? = nil, total: Int? = nil, userIds: [String]? = nil) {
        self.dryRun = dryRun
        self.hardDelete = hardDelete
        self.total = total
        self.userIds = userIds
    }
    
    
}
