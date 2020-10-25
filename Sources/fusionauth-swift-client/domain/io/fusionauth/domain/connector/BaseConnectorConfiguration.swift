//
//  BaseConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class BaseConnectorConfiguration:Codable{
    public var data:JSONObject
    public var debug:Bool?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var type:ConnectorType
    
}
