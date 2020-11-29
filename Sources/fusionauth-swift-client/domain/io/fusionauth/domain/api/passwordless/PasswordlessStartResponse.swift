//
//  PasswordlessStartResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/11/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public class PasswordlessStartResponse:Codable{
    public var code:String? = nil


    public init(code: String? = nil) {
        self.code = code
    }
}
