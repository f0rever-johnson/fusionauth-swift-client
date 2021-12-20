//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 12/19/21.
//

import Foundation

public class IdentityProviderTenantConfiguration:Codable{

    public var data:[String:JSONObject]? = nil
    public var limitUserLinkCount:IdentityProviderLimitUserLinkingPolicy? = nil
    
    public init(data: [String : JSONObject]? = nil, limitUserLinkCount: IdentityProviderLimitUserLinkingPolicy? = nil) {
        self.data = data
        self.limitUserLinkCount = limitUserLinkCount
    }
}
