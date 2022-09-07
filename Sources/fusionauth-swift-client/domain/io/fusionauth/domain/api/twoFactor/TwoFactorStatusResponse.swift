//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/30/22.
//

import Foundation

public class TwoFactorStatusResponse:Codable{
 
    public var trusts:[TwoFactorTrust]?
    public var twoFactorTrustId:String?
    
    public init(trusts: [TwoFactorTrust]? = nil, twoFactorTrustId: String? = nil) {
        self.trusts = trusts
        self.twoFactorTrustId = twoFactorTrustId
    }
}
