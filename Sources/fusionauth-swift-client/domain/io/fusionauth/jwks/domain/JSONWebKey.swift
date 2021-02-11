//
//  JSONWebKey.swift
//  A JSON Web Key as defined by <a href="https://tools.ietf.org/html/rfc7517#section-4">RFC 7517 JSON Web Key (JWK)section 4</a> and <a href="https://tools.ietf.org/html/rfc7518">RFC 7518 JSON Web Algorithms (JWA)</a>.
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class JSONWebKey{

    public var alg:Algorithm
    public var crv:String
    public var d:String
    public var dp:String
    public var dq:String
    public var e:String
    public var kid:String
    public var kty:KeyType
    public var n:String
    
    subscript(claim:String) -> Any{
        get{
            other?[claim] as Any
        }
        set(value){
            other?[claim] = value
        }
    }

    private var other:[String:Any]? = nil
    public var p:String
    public var q:String
    public var qi:String
    public var use:String
    public var x:String
    public var x5c:[String]
    public var x5t:String
    public var x5t_S256:String
    public var y:String
    
    public init(alg: Algorithm, crv: String, d: String, dp: String, dq: String, e: String, kid: String, kty: KeyType, n: String, other: [String : Any]? = nil, p: String, q: String, qi: String, use: String, x: String, x5c: [String], x5t: String, x5t_S256: String, y: String) {
        self.alg = alg
        self.crv = crv
        self.d = d
        self.dp = dp
        self.dq = dq
        self.e = e
        self.kid = kid
        self.kty = kty
        self.n = n
        self.other = other
        self.p = p
        self.q = q
        self.qi = qi
        self.use = use
        self.x = x
        self.x5c = x5c
        self.x5t = x5t
        self.x5t_S256 = x5t_S256
        self.y = y
    }
}
