//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class VerifyRegistrationRequest:Codable{

    public var oneTimeCode:String? = nil
    public var verificationId:String? = nil
    
    public init(oneTimeCode: String? = nil, verificationId: String? = nil) {
        self.oneTimeCode = oneTimeCode
        self.verificationId = verificationId
    }
}
