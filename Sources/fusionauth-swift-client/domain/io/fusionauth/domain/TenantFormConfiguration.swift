//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class TenantFormConfiguration:Codable{
    public var adminuserFormId:UUID?
    
    public init(adminuserFormId: UUID? = nil) {
        self.adminuserFormId = adminuserFormId
    }
}
