//
//  ValidateResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation


public class ValidateResponse:Codable{
    public var jwt:JWT?

    public init(jwt: JWT? = nil) {
        self.jwt = jwt
    }

}
