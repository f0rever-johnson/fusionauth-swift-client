//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class VersionResponse:Codable{

    public var version:String?
    
    public init(version: String? = nil) {
        self.version = version
    }
}
