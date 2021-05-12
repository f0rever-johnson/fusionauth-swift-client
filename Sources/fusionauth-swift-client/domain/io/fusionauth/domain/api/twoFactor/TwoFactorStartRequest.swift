//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorStartRequest:Codable{
    
    public var appliationId:UUID? = nil
    public var code:String? = nil
    public var loginId:String? = nil
    public var state:[String:JSONObject]? = nil
    
    public init(appliationId: UUID? = nil, code: String? = nil, loginId: String? = nil, state: [String : JSONObject]? = nil) {
        self.appliationId = appliationId
        self.code = code
        self.loginId = loginId
        self.state = state
    }
}
