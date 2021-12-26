//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorStartRequest:Codable{
    
    public var appliationId:UUID?
    public var code:String?
    public var loginId:String?
    public var state:[String:JSONObject]?
    
    public init(appliationId: UUID? = nil, code: String? = nil, loginId: String? = nil, state: [String : JSONObject]? = nil) {
        self.appliationId = appliationId
        self.code = code
        self.loginId = loginId
        self.state = state
    }
}
