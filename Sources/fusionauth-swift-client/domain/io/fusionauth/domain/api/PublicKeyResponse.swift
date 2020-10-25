//
//  PublicKeyResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
