//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

/**
 * Location information. Useful for IP addresses and other displayable data objects.
 *
 */

public struct Location:Codable{

    public var city:String?
    public var country:String?
    public var displayString:String
    public var latitude:Double?
    public var longitude:Double?
    public var region:String?
    public var zipcode:String?
    
    public init(city: String? = nil, country: String? = nil, displayString: String, latitude: Double? = nil, longitude: Double? = nil, region: String? = nil, zipcode: String? = nil) {
        self.city = city
        self.country = country
        self.displayString = displayString
        self.latitude = latitude
        self.longitude = longitude
        self.region = region
        self.zipcode = zipcode
    }
    
}
