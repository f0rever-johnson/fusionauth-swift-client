//
//  ConsentRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct ConsentRequest:Codable{
    public var consent:Consent? = nil

    public init(consent: Consent? = nil) {
        self.consent = consent
    }

}
