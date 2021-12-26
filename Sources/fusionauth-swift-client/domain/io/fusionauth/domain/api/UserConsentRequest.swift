//
//  UserConsentRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct UserConsentRequest:Codable{
    public var userConsent:UserConsent?

    public init(userConsent: UserConsent? = nil) {
        self.userConsent = userConsent
    }
}
