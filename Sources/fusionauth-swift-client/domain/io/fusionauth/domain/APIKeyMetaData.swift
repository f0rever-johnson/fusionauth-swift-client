//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class APIKeyMetaData:Codable{
    
    public var attributes:[String:String]? = nil
    
    public init(attributes: [String : String]? = nil) {
        self.attributes = attributes
    }
}
