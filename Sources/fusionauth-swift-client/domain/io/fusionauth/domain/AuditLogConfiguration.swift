//
//  AuditLogConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class AuditLogConfiguration:Codable{
    public var delete:DeleteConfiguration? = nil


    public init(delete: DeleteConfiguration? = nil) {
        self.delete = delete
    }
}
