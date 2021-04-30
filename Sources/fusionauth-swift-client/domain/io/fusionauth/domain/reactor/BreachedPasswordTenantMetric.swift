//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class BreachedPasswordTenantMetric:Codable{
    
    public var actionRequired:Int? = nil
    public var matchedCommonPasswordCount:Int? = nil
    public var matchedExactCount:Int? = nil
    public var matchedPasswordCount:Int? = nil
    public var matchedSubAddressCount:Int? = nil
    public var passwordsCheckedCount:Int? = nil
    
    public init(actionRequired: Int? = nil, matchedCommonPasswordCount: Int? = nil, matchedExactCount: Int? = nil, matchedPasswordCount: Int? = nil, matchedSubAddressCount: Int? = nil, passwordsCheckedCount: Int? = nil) {
        self.actionRequired = actionRequired
        self.matchedCommonPasswordCount = matchedCommonPasswordCount
        self.matchedExactCount = matchedExactCount
        self.matchedPasswordCount = matchedPasswordCount
        self.matchedSubAddressCount = matchedSubAddressCount
        self.passwordsCheckedCount = passwordsCheckedCount
    }
    
    
    
    
    
}
