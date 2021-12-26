//
//  IssueResposne.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct IssueResponse:Codable{
    public var refreshToken:String?
    public var token:String?

    public init(refreshToken: String? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.token = token
    }

}
