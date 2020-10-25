//
//  DeviceResponse.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class DeviceResponse:Codable{
    
    public var deviceCode:String? = nil
    public var expiresIn:Int? = nil
    public var interval:Int? = nil
    public var userCode:String? = nil
    public var verificationURI:String? = nil
    public var verificationURIComplete:String? = nil

    public init(deviceCode: String? = nil, expiresIn: Int? = nil, interval: Int? = nil, userCode: String? = nil, verificationURI: String? = nil, verificationURIComplete: String? = nil) {
        self.deviceCode = deviceCode
        self.expiresIn = expiresIn
        self.interval = interval
        self.userCode = userCode
        self.verificationURI = verificationURI
        self.verificationURIComplete = verificationURIComplete
    }
    
    private enum CodingKeys:String, CodingKey{
        case deviceCode = "device_code"
        case expiresIn = "expires_in"
        case interval
        case userCode = "user_code"
        case verificationURI = "verification_uri"
        case verificationURIComplete = "verification_uri_complete"
    }
}
