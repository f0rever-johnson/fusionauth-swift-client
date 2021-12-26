//
//  SendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class SendRequest:Codable{
    
    public var applicationId:UUID?
    public var bccAddresses:[String]?
    public var ccAddresses:[String]?
    public var preferredLanguages:[String]?
    public var requestData:[String:JSONObject]?
    public var toAddresses:[EmailAddress]?
    public var userIds:[UUID]?
    
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
