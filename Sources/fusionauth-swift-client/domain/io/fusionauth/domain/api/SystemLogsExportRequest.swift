//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class SystemLogsExportRequest:BaseExportRequest{
    public var lastNBytes:Int?
    
    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil, lastNBytes: Int? = nil) {
        self.lastNBytes = lastNBytes
        super.init(dateTimeSecondsFormat: dateTimeSecondsFormat, zoneId: zoneId)
    }
    
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lastNBytes = try container.decode(Int.self, forKey: .lastNBytes)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case lastNBytes
    }
}
