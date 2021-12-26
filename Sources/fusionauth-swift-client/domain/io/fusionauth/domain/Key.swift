//
//  Key.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Domain for a public key, key pair or an HMAC secret. This is used by KeyMaster to manage keys for JWTs, SAML, etc.
 *
 */

public class Key:Codable{
    public var algorithm:KeyAlgorithm?
    public var certificate:String?
    public var certificateInformation:CertificateInformation?
    public var expirationInstant:Date?
    public var hasPrivateKey:Bool?
    public var id:UUID?
    public var insertInstant:Date?
    public var issuer:String?
    public var kid:String?
    public var lastUpdateInstant:Date?
    public var length:Int?
    public var name:String?
    public var privateKey:String?
    public var publicKey:String?
    public var secret:String?
    public var type:KeyType?
    
    public init(algorithm: KeyAlgorithm? = nil, certificate: String? = nil, certificateInformation: CertificateInformation? = nil, expirationInstant: Date? = nil, hasPrivateKey: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, issuer: String? = nil, kid: String? = nil, lastUpdateInstant: Date? = nil, length: Int? = nil, name: String? = nil, privateKey: String? = nil, publicKey: String? = nil, secret: String? = nil, type: KeyType? = nil) {
        self.algorithm = algorithm
        self.certificate = certificate
        self.certificateInformation = certificateInformation
        self.expirationInstant = expirationInstant
        self.hasPrivateKey = hasPrivateKey
        self.id = id
        self.insertInstant = insertInstant
        self.issuer = issuer
        self.kid = kid
        self.lastUpdateInstant = lastUpdateInstant
        self.length = length
        self.name = name
        self.privateKey = privateKey
        self.publicKey = publicKey
        self.secret = secret
        self.type = type
    }
}


