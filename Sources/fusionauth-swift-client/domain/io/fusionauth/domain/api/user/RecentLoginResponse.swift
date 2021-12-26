//
//  RecentLoginResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct RecentLoginResponse:Codable{
    public var logins:[DisplayableRawLogin]?

    public init(logins: [DisplayableRawLogin]? = nil) {
        self.logins = logins
    }

}
