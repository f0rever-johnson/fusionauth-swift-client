//
//  CORSConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class CORSConfiguration:Codable, Enableable{
   
    public var allowCredentials:Bool? = nil
    public var allowedHeaders:[String]? = nil
    public var allowedMethods:[HTTPMethod]? = nil
    public var allowedOrigins:[String]? = nil
    public var debug:Bool? = nil
    public var exposedHeaders:[String]? = nil
    public var preflightMaxAgeInSeconds:Int? = nil
    public var enabled: Bool? = nil
    
    public init(allowCredentials: Bool? = nil, allowedHeaders: [String]? = nil, allowedMethods: [HTTPMethod]? = nil, allowedOrigins: [String]? = nil, debug: Bool? = nil, exposedHeaders: [String]? = nil, preflightMaxAgeInSeconds: Int? = nil, enabled: Bool? = nil) {
        self.allowCredentials = allowCredentials
        self.allowedHeaders = allowedHeaders
        self.allowedMethods = allowedMethods
        self.allowedOrigins = allowedOrigins
        self.debug = debug
        self.exposedHeaders = exposedHeaders
        self.preflightMaxAgeInSeconds = preflightMaxAgeInSeconds
        self.enabled = enabled
    }

}
