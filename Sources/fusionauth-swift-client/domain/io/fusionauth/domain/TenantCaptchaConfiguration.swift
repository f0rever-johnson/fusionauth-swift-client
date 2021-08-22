//
//  File 2.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct TenantCaptchaConfiguration:Codable{
    public init(captchaMethod: CaptchaMethod? = nil, secretKey: String? = nil, siteKey: String? = nil, threshold: Double? = nil) {
        self.captchaMethod = captchaMethod
        self.secretKey = secretKey
        self.siteKey = siteKey
        self.threshold = threshold
    }
    
    public var captchaMethod:CaptchaMethod?
    public var secretKey:String?
    public var siteKey:String?
    public var threshold:Double?
}
