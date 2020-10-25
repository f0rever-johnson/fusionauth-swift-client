//
//  VerifyRegistrationResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct VerifyRegistrationResponse:Codable {
    public var verificationId:String? = nil

    public init(verificationId: String? = nil) {
        self.verificationId = verificationId
    }

}
