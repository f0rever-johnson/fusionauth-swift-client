//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

public class SAMLv2SingleLogout:Codable, Enableable{

    public var enabled: Bool?
    public var keyId:UUID?
    public var url:String?
    public var xmlSignatureC14nMethod:CanonicalizationMethod?
    
    public init(enabled: Bool? = nil, keyId: UUID? = nil, url: String? = nil, xmlSignatureC14nMethod: CanonicalizationMethod? = nil) {
        self.enabled = enabled
        self.keyId = keyId
        self.url = url
        self.xmlSignatureC14nMethod = xmlSignatureC14nMethod
    }
    
   
    
}
