//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///Request for managing FusionAuth Reactor and licenses.
public class ReactorRequest:Codable{

    public var license:String? = nil
    public var licenseId:String? = nil
    
    public init(license: String? = nil, licenseId: String? = nil) {
        self.license = license
        self.licenseId = licenseId
    }

}
