//
//  ValidateResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct ValidateResponse:Codable{
    public var jwt:JWT? = nil

    public init(jwt: JWT? = nil) {
        self.jwt = jwt
    }

}
