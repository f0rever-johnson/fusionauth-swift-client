//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public enum CaptchaMethod:String, Codable{
    case googleRecaptchaV2 = "GoogleRecaptchaV2"
    case googleRecaptchaV3 = "GoogleRecaptchaV3"
    case hCaptcha = "HCaptcha"
    case hCaptchaEnterprise = "HCaptchaEnterprise"
}
