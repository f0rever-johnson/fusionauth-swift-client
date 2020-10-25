//
//  ApplicationResposne.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct ApplicationResponse:Codable {
    public var application:Application? = nil
    public var applications:[Application]? = nil
    public var role:ApplicationRole? = nil


    public init(application: Application? = nil, applications: [Application]? = nil, role: ApplicationRole? = nil) {
        self.application = application
        self.applications = applications
        self.role = role
    }
}
