//
//  Totals.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct Totals:Codable{
    public var logins:UInt64? = nil
    public var registrations:UInt64? = nil
    public var totalRegistrations:UInt64? = nil

    public init(logins: UInt64? = nil, registrations: UInt64? = nil, totalRegistrations: UInt64? = nil) {
        self.logins = logins
        self.registrations = registrations
        self.totalRegistrations = totalRegistrations
    }

}
