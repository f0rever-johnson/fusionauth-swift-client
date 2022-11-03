//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/3/22.
//

import Foundation


/**
 * Search request for Groups.
 *
 */

public class GroupSearchRequest:Codable{
    
    public var search:GroupSearchCriteria?
    
    public init(search: GroupSearchCriteria? = nil) {
        self.search = search
    }
}
