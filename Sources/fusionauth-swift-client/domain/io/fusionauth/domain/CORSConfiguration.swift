//
//  CORSConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class CORSConfiguration:Codable, Enableable{
   
    public var allowCredentials:Bool?
    public var allowedHeaders:[String]?
    public var allowedMethods:[HTTPMethod]?
    public var allowedOrigins:[String]?
    public var debug:Bool?
    public var exposedHeaders:[String]?
    public var preflightMaxAgeInSeconds:Int?
    public var enabled: Bool? 
    
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
