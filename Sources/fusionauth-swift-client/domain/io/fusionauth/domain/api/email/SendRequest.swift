//
//  SendRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class SendRequest:Codable{
    public var bccAddresses:[String]? = nil
    public var ccAddresses:[String]? = nil
    public var requestData:[String:JSONObject]? = nil
    public var userIds:[UUID]? = nil


    public init(bccAddresses: [String]? = nil, ccAddresses: [String]? = nil, requestData: [String:JSONObject]? = nil, userIds: [UUID]? = nil) {
        self.bccAddresses = bccAddresses
        self.ccAddresses = ccAddresses
        self.requestData = requestData
        self.userIds = userIds
    }
}
