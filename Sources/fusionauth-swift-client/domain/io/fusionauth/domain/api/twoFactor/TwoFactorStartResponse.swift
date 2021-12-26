//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class TwoFactorStartResponse:Codable{
   
    public var code:String?
    public var methods:[TwoFactorMethod]?
    public var twoFactorId:String?
    
    public init(code: String? = nil, methods: [TwoFactorMethod]? = nil, twoFactorId: String? = nil) {
        self.code = code
        self.methods = methods
        self.twoFactorId = twoFactorId
    }
}
