//
//  LoginRecordSearchRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class LoginRecordSearchRequest:Codable{
    public var retrieveTotale:Bool? = nil
    public var search:LoginRecordSearchCriteria? = nil

    public init(retrieveTotale: Bool? = nil, search: LoginRecordSearchCriteria? = nil) {
        self.retrieveTotale = retrieveTotale
        self.search = search
    }

}
