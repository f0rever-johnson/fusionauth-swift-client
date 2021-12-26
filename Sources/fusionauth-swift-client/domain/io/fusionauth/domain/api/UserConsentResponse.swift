//
//  UserConsentResposne.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct UserConsentResponse:Codable{
    public var userConsent:UserConsent?
    public var userConsents:[UserConsent]?

    public init(userConsent: UserConsent? = nil, userConsents: [UserConsent]? = nil) {
        self.userConsent = userConsent
        self.userConsents = userConsents
    }
}
