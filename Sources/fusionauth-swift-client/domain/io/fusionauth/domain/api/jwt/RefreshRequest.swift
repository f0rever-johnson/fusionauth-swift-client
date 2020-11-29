//
//  RefreshRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct RefreshRequest:Codable{
    public var refreshToken:String? = nil

    public init(refreshToken: String? = nil) {
        self.refreshToken = refreshToken
    }

}
