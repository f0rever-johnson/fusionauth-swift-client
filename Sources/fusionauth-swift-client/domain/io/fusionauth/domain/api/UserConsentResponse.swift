//
//  UserConsentResposne.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserConsentResponse:Codable{
    public var userConsent:UserConsent? = nil
    public var userConsents:[UserConsent]? = nil

    public init(userConsent: UserConsent? = nil, userConsents: [UserConsent]? = nil) {
        self.userConsent = userConsent
        self.userConsents = userConsents
    }
}
