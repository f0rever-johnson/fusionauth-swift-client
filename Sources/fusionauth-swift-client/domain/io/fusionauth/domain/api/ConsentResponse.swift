//
//  ConsentResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct ConsentResponse:Codable{
    public var consent:Consent? = nil
    public var consents:[Consent]? = nil

    public init(consent: Consent? = nil, consents: [Consent]? = nil) {
        self.consent = consent
        self.consents = consents
    }

}
