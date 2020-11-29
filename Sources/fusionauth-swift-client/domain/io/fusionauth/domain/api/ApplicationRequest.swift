//
//  ApplicationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct ApplicationRequest:Codable{
    public var application:Application? = nil
    public var webhookIds:[UUID]? = nil
    public var role:ApplicationRole? = nil

    public init(application: Application? = nil, webhookIds: [UUID]? = nil, role: ApplicationRole? = nil) {
        self.application = application
        self.webhookIds = webhookIds
        self.role = role
    }

}
