//
//  LoginRecordSearchResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct LoginRecordSearchResponse:Codable{
    public var logins:[DisplayableRawLogin]? = nil
    public var total:UInt64? = nil

    public init(logins: [DisplayableRawLogin]? = nil, total: UInt64? = nil) {
        self.logins = logins
        self.total = total
    }

}
