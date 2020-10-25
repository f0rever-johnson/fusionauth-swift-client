//
//  PreviewResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
