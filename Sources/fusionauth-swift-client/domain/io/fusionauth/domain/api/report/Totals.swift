//
//  Totals.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct Totals:Codable{
    public var logins:UInt64?
    public var registrations:UInt64?
    public var totalRegistrations:UInt64?

    public init(logins: UInt64? = nil, registrations: UInt64? = nil, totalRegistrations: UInt64? = nil) {
        self.logins = logins
        self.registrations = registrations
        self.totalRegistrations = totalRegistrations
    }

}
