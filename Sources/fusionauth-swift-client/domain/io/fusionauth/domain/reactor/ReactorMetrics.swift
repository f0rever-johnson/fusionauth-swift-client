//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class ReactorMetrics:Codable{

    public var breachedPasswordMetrics:[String:BreachedPasswordTenantMetric]? = nil
    
    public init(breachedPasswordMetrics: [String : BreachedPasswordTenantMetric]? = nil) {
        self.breachedPasswordMetrics = breachedPasswordMetrics
    }
}
