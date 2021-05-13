//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class ReactorResponse:Codable{
    
    public var metrics:ReactorMetrics? = nil
    public var status:ReactorStatus? = nil
    
    public init(metrics: ReactorMetrics? = nil, status: ReactorStatus? = nil) {
        self.metrics = metrics
        self.status = status
    }
}
