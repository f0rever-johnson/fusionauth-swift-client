//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class BreachedPasswordTenantMetric:Codable{
    
    public var actionRequired:Int?
    public var matchedCommonPasswordCount:Int?
    public var matchedExactCount:Int?
    public var matchedPasswordCount:Int?
    public var matchedSubAddressCount:Int?
    public var passwordsCheckedCount:Int?
    
    public init(actionRequired: Int? = nil, matchedCommonPasswordCount: Int? = nil, matchedExactCount: Int? = nil, matchedPasswordCount: Int? = nil, matchedSubAddressCount: Int? = nil, passwordsCheckedCount: Int? = nil) {
        self.actionRequired = actionRequired
        self.matchedCommonPasswordCount = matchedCommonPasswordCount
        self.matchedExactCount = matchedExactCount
        self.matchedPasswordCount = matchedPasswordCount
        self.matchedSubAddressCount = matchedSubAddressCount
        self.passwordsCheckedCount = passwordsCheckedCount
    }
    
    
    
    
    
}
