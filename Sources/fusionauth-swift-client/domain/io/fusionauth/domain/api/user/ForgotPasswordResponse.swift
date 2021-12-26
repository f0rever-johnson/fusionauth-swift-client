//
//  ForgotPasswordResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct ForgotPasswordResponse:Codable {
    public var changePasswordId:String?

    public init(changePasswordId: String? = nil) {
        self.changePasswordId = changePasswordId
    }

}
