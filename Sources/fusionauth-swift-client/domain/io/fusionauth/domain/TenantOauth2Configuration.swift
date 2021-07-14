//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public class TenantOauth2Configuration:Codable{

    public var clientCredentialsAccessTokenPopulateLambdaId:UUID? = nil
    
    public init(clientCredentialsAccessTokenPopulateLambdaId: UUID? = nil) {
        self.clientCredentialsAccessTokenPopulateLambdaId = clientCredentialsAccessTokenPopulateLambdaId
    }
}
