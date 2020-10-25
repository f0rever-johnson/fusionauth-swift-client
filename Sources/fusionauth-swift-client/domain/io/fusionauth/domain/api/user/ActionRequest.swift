//
//  ActionRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class ActionRequest:Codable{
    public var action:ActionData? = nil
    public var broadcast:Bool? = nil

    public init(action: ActionData? = nil, broadcast: Bool? = nil) {
        self.action = action
        self.broadcast = broadcast
    }

}
