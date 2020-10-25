//
//  EmailAddress.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EmailAddress:Codable{
    public var address:String? = nil
    public var display:String? = nil

    public init(address: String? = nil, display: String? = nil) {
        self.address = address
        self.display = display
    }

}
