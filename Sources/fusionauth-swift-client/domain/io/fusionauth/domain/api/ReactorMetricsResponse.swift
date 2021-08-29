//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/29/21.
//

import Foundation

public struct ReactorMetricsResponse:Codable{
    public var metrics:ReactorMetrics?

    public init(metrics: ReactorMetrics? = nil) {
        self.metrics = metrics
    }

}
