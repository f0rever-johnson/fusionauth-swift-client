//
//  JSONWebKey.swift
//  A JSON Web Key as defined by <a href="https://tools.ietf.org/html/rfc7517#section-4">RFC 7517 JSON Web Key (JWK)section 4</a> and <a href="https://tools.ietf.org/html/rfc7518">RFC 7518 JSON Web Algorithms (JWA)</a>.
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class JSONWebKey:Codable{
    public var alg:Algorithm
    public var crv:String
    public var d:String
    public var dp:String
    public var dq:String
    public var e:String
    public var kid:String
    public var kty:KeyType
    public var n:String
    
    //missing code here
    public var p:String
    public var q:String
    public var qi:String
    public var use:String
    public var x:String
    public var x5c:[String]
    public var x5t:String
    public var x5t_S256:String
    public var y:String
}
