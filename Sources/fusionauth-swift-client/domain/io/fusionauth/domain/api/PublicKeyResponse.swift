//
//  PublicKeyResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct PublicKeyResponse:Codable {
    public var publicKey:String? = nil
    public var publicKeys:[String:String]? = nil

    public init(publicKey: String? = nil, publicKeys: [String:String]? = nil) {
        self.publicKey = publicKey
        self.publicKeys = publicKeys
    }
}
