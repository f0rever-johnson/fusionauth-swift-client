//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class RefreshTokenRevocationPolicy:Codable{
    public var onLoginPrevented:Bool?
    public var onPasswordChanged:Bool?
    
    internal init(onLoginPrevented: Bool? = nil, onPasswordChanged: Bool? = nil) {
        self.onLoginPrevented = onLoginPrevented
        self.onPasswordChanged = onPasswordChanged
    }
    
}
