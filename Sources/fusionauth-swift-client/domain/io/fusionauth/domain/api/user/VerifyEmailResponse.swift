//
//  VerifyEmailResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct VerifyEmailResponse:Codable {
    public var verificationId:String? = nil

    public init(verificationId: String? = nil) {
        self.verificationId = verificationId
    }

}
