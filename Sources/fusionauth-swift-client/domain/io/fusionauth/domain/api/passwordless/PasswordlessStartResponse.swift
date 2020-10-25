//
//  PasswordlessStartResponse.swift//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class PasswordlessStartResponse:Codable{
    public var code:String? = nil


    public init(code: String? = nil) {
        self.code = code
    }
}
