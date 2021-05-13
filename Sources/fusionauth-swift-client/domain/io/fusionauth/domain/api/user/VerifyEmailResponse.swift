//
//  VerifyEmailResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct VerifyEmailResponse:Codable {
   
    public var oneTimeCode:String? = nil
    public var verificationId:String? = nil
    
    public init(oneTimeCode: String? = nil, verificationId: String? = nil) {
        self.oneTimeCode = oneTimeCode
        self.verificationId = verificationId
    }

}
