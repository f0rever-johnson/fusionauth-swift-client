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
    public var trustChallenge:String?
    public var userId:UUID?
    
    public init(appliationId: UUID? = nil, code: String? = nil, loginId: String? = nil, state: [String : JSONObject]? = nil, trustChallenge: String? = nil, userId: UUID? = nil) {
        self.appliationId = appliationId
        self.code = code
        self.loginId = loginId
        self.state = state
        self.trustChallenge = trustChallenge
        self.userId = userId
    }
}
