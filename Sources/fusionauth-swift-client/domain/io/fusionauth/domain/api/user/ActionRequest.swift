//
//  ActionRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
