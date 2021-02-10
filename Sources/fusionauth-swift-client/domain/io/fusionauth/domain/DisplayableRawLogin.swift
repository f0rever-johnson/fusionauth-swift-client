//
//  DisplayableRawLogin.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class DisplayableRawLogin:RawLogin{
    public var applicationName:String? = nil
    public var loginId:String? = nil
    
    public init(applicationName: String? = nil, loginId: String? = nil) {
        self.applicationName = applicationName
        self.loginId = loginId
    }
   
}
