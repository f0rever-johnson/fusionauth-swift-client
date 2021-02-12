//
//  LoginRecordSearchRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class LoginRecordSearchRequest:Codable{
    public var retrieveTotal:Bool? = nil
    public var search:LoginRecordSearchCriteria? = nil

    public init(retrieveTotale: Bool? = nil, search: LoginRecordSearchCriteria? = nil) {
        self.retrieveTotal = retrieveTotale
        self.search = search
    }

}
