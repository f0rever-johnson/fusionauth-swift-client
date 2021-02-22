//
//  JWT.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class JWT:Codable{
    public var aud:String? = nil
    public var exp:Date? = nil
    public var iat:Date? = nil
    public var iss:String? = nil
    public var jti:String? = nil
    public var nbf:Date? = nil
    public var sub:String? = nil
    public var otherClaims:[String:JSONObject]? = nil
    
    private enum CodingKeys: String, CodingKey{
        case aud
        case exp
        case iat
        case iss
        case jti
        case nbf
        case sub
    }
    
    required public init(from decoder: Decoder) throws{
        
        let knownContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        // Known data decoding
        aud = try? knownContainer.decode(String.self, forKey: .aud)
        if let expTimeInt = try? knownContainer.decode(Double.self, forKey: .exp){
            exp = Date(timeIntervalSince1970: expTimeInt)
        }
        if let iatTimeInt = try? knownContainer.decode(Double.self, forKey: .iat){
            iat = Date(timeIntervalSince1970: iatTimeInt)
        }
        iss = try? knownContainer.decode(String.self, forKey: .iss)
        jti = try? knownContainer.decode(String.self, forKey: .jti)
        if let nbfTimeInt = try? knownContainer.decode(Double.self, forKey: .nbf){
            nbf = Date(timeIntervalSince1970: nbfTimeInt)
        }
        sub = try? knownContainer.decode(String.self, forKey: .sub)

        // Additional data decoding
        let unknownContainer = try decoder.container(keyedBy: OtherClaimsCodingKeys.self)
        self.otherClaims = unknownContainer.decodeUnknownKeyValues(exclude: CodingKeys.self)
    }
}
private struct OtherClaimsCodingKeys: CodingKey{
    var stringValue: String
    init?(stringValue: String){
        self.stringValue = stringValue
    }

    var intValue: Int?
    init?(intValue: Int){
        return nil
    }
}

extension KeyedDecodingContainer where Key == OtherClaimsCodingKeys{
    func decodeUnknownKeyValues<T: CodingKey>(exclude keyedBy: T.Type) -> [String: JSONObject]{
        var data = [String: JSONObject]()

        for key in allKeys{
            if keyedBy.init(stringValue: key.stringValue) == nil{
                if let value = try? decode(JSONObject.self, forKey: key){
                    data[key.stringValue] = value
                }else{
                    NSLog("Key %@ type not supported", key.stringValue)
                }
            }
        }

        return data
    }
}

