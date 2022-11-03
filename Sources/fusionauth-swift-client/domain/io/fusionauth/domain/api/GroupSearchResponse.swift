//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/3/22.
//

import Foundation


/**
 * Search response for Groups
 *
 */

public class GroupSearchResponse:Codable{

    public var groups:[Group]?
    public var total:Int?
    
    public init(groups: [Group]? = nil, total: Int? = nil) {
        self.groups = groups
        self.total = total
    }
}
