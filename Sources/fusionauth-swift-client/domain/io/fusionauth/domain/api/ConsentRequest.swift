//
//  ConsentRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct ConsentRequest:Codable{
    public var consent:Consent? = nil

    public init(consent: Consent? = nil) {
        self.consent = consent
    }

}
