//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class GroupMemberSearchRequest:Codable{
 
    public var search:GroupMemberSearchCriteria?
    
    public init(search: GroupMemberSearchCriteria? = nil) {
        self.search = search
    }
}
