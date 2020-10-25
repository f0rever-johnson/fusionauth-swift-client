//
//  IssueResposne.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct IssueResponse:Codable{
    public var refreshToken:String? = nil
    public var token:String? = nil

    public init(refreshToken: String? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.token = token
    }

}
