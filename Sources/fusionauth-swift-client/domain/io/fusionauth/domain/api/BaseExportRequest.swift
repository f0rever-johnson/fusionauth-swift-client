//
//  BaseExportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class BaseExportRequest:Codable{

    public var dateTimeSecondsFormat:String?
    public var zoneId:String?
    
    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil) {
        self.dateTimeSecondsFormat = dateTimeSecondsFormat
        self.zoneId = zoneId
    }
}
