//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class SystemLogsExportRequest:BaseExportRequest, Codable{
    public var dateTimeSecondsFormat: String?
    public var zoneId: String?
    public var lastNBytes:Int?
    
    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil, lastNBytes: Int? = nil) {
        self.dateTimeSecondsFormat = dateTimeSecondsFormat
        self.zoneId = zoneId
        self.lastNBytes = lastNBytes
    }
}
