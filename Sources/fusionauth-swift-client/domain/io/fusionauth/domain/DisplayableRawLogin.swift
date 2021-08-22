//
//  DisplayableRawLogin.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class DisplayableRawLogin:RawLogin{
    
    public var applicationName:String?
    public var location:Location?
    public var loginId:String?
    
    public init(applicationName: String? = nil, location: Location? = nil, loginId: String? = nil) {
        self.applicationName = applicationName
        self.location = location
        self.loginId = loginId
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        applicationName = try container.decode(String.self, forKey: .applicationName)
        location = try container.decode(Location.self, forKey: .location)
        loginId = try container.decode(String.self, forKey: .loginId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public enum CodingKeys:CodingKey{
        case applicationName
        case location
        case loginId
    }

}
