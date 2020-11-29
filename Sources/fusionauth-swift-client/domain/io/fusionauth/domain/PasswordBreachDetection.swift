//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class PasswordBreachDetection:Codable{
    public var matchMode:BreachMatchMode? = nil
    public var notifyUserEmailTemplateId:UUID? = nil
    public var onLogin:BreachAction? = nil
    
    public init(matchMode: BreachMatchMode? = nil, notifyUserEmailTemplateId: UUID? = nil, onLogin: BreachAction? = nil) {
        self.matchMode = matchMode
        self.notifyUserEmailTemplateId = notifyUserEmailTemplateId
        self.onLogin = onLogin
    }
}
