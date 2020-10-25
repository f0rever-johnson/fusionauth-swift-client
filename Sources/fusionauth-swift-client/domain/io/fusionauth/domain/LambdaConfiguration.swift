//
//  LambdaConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct LambdaConfiguration:Codable{
    
    public var accessTokenPopulateId: UUID? = nil
    public var idTokenPopulateId:UUID? = nil
    public var samlv2PopulateId: UUID? = nil

    public init(accessTokenPopulateId: UUID? = nil, idTokenPopulateId: UUID? = nil, samlv2PopulateId: UUID? = nil) {
        self.accessTokenPopulateId = accessTokenPopulateId
        self.idTokenPopulateId = idTokenPopulateId
        self.samlv2PopulateId = samlv2PopulateId
    }

}
