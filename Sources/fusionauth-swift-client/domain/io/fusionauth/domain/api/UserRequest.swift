//
//  UserRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

public struct UserRequest:Codable{
    public var sendSetPasswordEmail:Bool? = nil
    public var skipVerification:Bool? = nil
    public var user:User? = nil

    public init(sendSetPasswordEmail: Bool? = nil, skipVerification: Bool? = nil, user: User? = nil) {
        self.sendSetPasswordEmail = sendSetPasswordEmail
        self.skipVerification = skipVerification
        self.user = user
    }
}
