//
//  JWT.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class JWT:Codable{
    public var aud:JSONObject? = nil
    public var exp:Date? = nil
    public var iat:Date? = nil
    public var iss:String? = nil
    public var jti:String? = nil
    public var nbf:Date? = nil
    
    subscript(claim:String) -> JSONObject?{
        get{
            otherClaims[claim]
        }
        set(value){
            otherClaims[claim] = value
        }
    }
    
    private var otherClaims:[String:JSONObject] = [String:JSONObject]()
    public var sub:String? = nil

}
