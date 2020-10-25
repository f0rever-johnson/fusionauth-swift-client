//
//  UserConsentRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct UserConsentRequest:Codable{
    public var userConsent:UserConsent? = nil

    public init(userConsent: UserConsent? = nil) {
        self.userConsent = userConsent
    }
}
