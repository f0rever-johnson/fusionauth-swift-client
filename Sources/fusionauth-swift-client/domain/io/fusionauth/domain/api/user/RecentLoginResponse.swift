//
//  RecentLoginResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct RecentLoginResponse:Codable{
    public var logins:[DisplayableRawLogin]? = nil

    public init(logins: [DisplayableRawLogin]? = nil) {
        self.logins = logins
    }

}
