//
//  ApplicationResposne.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct ApplicationResponse:Codable {
    public var application:Application?
    public var applications:[Application]?
    public var role:ApplicationRole?


    public init(application: Application? = nil, applications: [Application]? = nil, role: ApplicationRole? = nil) {
        self.application = application
        self.applications = applications
        self.role = role
    }
}
