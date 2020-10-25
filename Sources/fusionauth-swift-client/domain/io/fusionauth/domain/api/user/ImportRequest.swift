//
//  ImportRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct ImportRequest:Codable {
    public var encryptionScheme:String? = nil
    public var factor:Int? = nil
    public var users:[User]? = nil
    public var validateDbConstraints:Bool? = nil

    public init(encryptionScheme: String? = nil, factor: Int? = nil, users: [User]? = nil, validateDbConstraints: Bool? = nil) {
        self.encryptionScheme = encryptionScheme
        self.factor = factor
        self.users = users
        self.validateDbConstraints = validateDbConstraints
    }

}
