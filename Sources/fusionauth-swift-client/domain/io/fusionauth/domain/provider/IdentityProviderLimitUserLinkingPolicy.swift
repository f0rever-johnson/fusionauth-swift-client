//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 12/19/21.
//

import Foundation

public class IdentityProviderLimitUserLinkingPolicy:Codable, Enableable{

    public var enabled: Bool?
    
    public var maximumLinks:Int?
    
    public init(enabled: Bool? = nil, maximumLinks: Int? = nil) {
        self.enabled = enabled
        self.maximumLinks = maximumLinks
    }
}
