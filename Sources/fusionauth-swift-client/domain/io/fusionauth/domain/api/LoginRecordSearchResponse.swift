//
//  LoginRecordSearchResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
