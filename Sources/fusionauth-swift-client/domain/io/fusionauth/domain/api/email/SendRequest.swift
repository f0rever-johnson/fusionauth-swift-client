//
//  SendRequest.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
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
