//
//  PreviewResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct PreviewResponse:Codable {
    public var email:Email? = nil
    public var errors:Errors? = nil

    public init(email: Email? = nil, errors: Errors? = nil) {
        self.email = email
        self.errors = errors
    }

}
