//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct IPAccessControlEntry:Codable{

    public var action:IPAccessControlEntryAction?
    public var endIPAddress:String?
    public var startIPAddress:String?
    
    public init(action:IPAccessControlEntryAction, endIPAddress: String? = nil, startIPAddress: String? = nil) {
        self.action = action
        self.endIPAddress = endIPAddress
        self.startIPAddress = startIPAddress
    }
}
