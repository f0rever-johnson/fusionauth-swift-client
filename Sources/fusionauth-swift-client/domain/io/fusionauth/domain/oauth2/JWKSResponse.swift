//
//  JWKSResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class JWKSResponse:Codable{
    public var keys:[JSONObject]? = nil

    public init(keys: [JSONObject]? = nil) {
        self.keys = keys
    }
}
