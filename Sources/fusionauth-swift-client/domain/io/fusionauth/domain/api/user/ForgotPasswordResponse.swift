//
//  ForgotPasswordResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct ForgotPasswordResponse:Codable {
    public var changePasswordId:String? = nil

    public init(changePasswordId: String? = nil) {
        self.changePasswordId = changePasswordId
    }

}
