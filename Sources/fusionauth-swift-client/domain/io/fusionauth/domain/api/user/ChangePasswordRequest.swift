//
//  ChangePasswordRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct ChangePasswordRequest:Codable {
    public var currentPassword:String? = nil
    public var loginId:String? = nil
    public var password:String? = nil
    public var refreshToken:String? = nil

    public init(currentPassword: String? = nil, loginId: String? = nil, password: String? = nil, refreshToken: String? = nil) {
        self.currentPassword = currentPassword
        self.loginId = loginId
        self.password = password
        self.refreshToken = refreshToken
    }

}
