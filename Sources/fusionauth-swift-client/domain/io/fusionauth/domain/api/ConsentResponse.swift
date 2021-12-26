//
//  ConsentResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct ConsentResponse:Codable{
    public var consent:Consent?
    public var consents:[Consent]?

    public init(consent: Consent? = nil, consents: [Consent]? = nil) {
        self.consent = consent
        self.consents = consents
    }

}
