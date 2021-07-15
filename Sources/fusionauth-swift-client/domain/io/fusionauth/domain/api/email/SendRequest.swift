//
//  SendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class SendRequest:Codable{
    
    public var applicationId:UUID? = nil
    public var bccAddresses:[String]? = nil
    public var ccAddresses:[String]? = nil
    public var preferredLanguages:[String]? = nil
    public var requestData:[String:JSONObject]? = nil
    public var toAddresses:[EmailAddress]? = nil
    public var userIds:[UUID]? = nil
    
    public init(applicationId: UUID? = nil, bccAddresses: [String]? = nil, ccAddresses: [String]? = nil, preferredLanguages: [String]? = nil, requestData: [String : JSONObject]? = nil, toAddresses: [EmailAddress]? = nil, userIds: [UUID]? = nil) {
        self.applicationId = applicationId
        self.bccAddresses = bccAddresses
        self.ccAddresses = ccAddresses
        self.preferredLanguages = preferredLanguages
        self.requestData = requestData
        self.toAddresses = toAddresses
        self.userIds = userIds
    }
    
}
