//
//  RegistrationReportResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct RegistrationReportResponse:Codable {
    public var hourlyCounts:[Count]? = nil
    public var total:UInt64? = nil

    public init(hourlyCounts: [Count]? = nil, total: UInt64? = nil) {
        self.hourlyCounts = hourlyCounts
        self.total = total
    }

}
