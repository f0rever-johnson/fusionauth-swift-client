//
//  AuditLogExportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class AuditLogExportRequest:BaseExportRequest{

    public var criteria:AuditLogSearchCriteria? = nil

    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil, criteria: AuditLogSearchCriteria? = nil) {
        self.criteria = criteria
        super.init(dateTimeSecondsFormat: dateTimeSecondsFormat, zoneId: zoneId)
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        criteria = try container.decode(AuditLogSearchCriteria.self, forKey: .criteria)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case criteria
    }
    
}
