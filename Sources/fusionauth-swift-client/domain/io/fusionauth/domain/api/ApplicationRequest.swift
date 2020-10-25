//
//  ApplicationRequest.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
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
