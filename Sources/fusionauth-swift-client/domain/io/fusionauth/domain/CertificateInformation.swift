//
//  CertificateInformation.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class CertificateInformation:Codable{
    
    public var issuer:String?
    public var md5Fingerprint:String?
    public var serialNumber:String?
    public var sha1Fingerprint:String?
    public var sha1Thumbprint:String?
    public var sha256Fingerprint:String?
    public var sha256Thumbprint:String?
    public var subject:String?
    public var validFrom:Date?
    public var validTo:Date? 

    public init(issuer: String? = nil, md5Fingerprint: String? = nil, serialNumber: String? = nil, sha1Fingerprint: String? = nil, sha1Thumbprint: String? = nil, sha256Fingerprint: String? = nil, sha256Thumbprint: String? = nil, subject: String? = nil, validFrom: Date? = nil, validTo: Date? = nil) {
        self.issuer = issuer
        self.md5Fingerprint = md5Fingerprint
        self.serialNumber = serialNumber
        self.sha1Fingerprint = sha1Fingerprint
        self.sha1Thumbprint = sha1Thumbprint
        self.sha256Fingerprint = sha256Fingerprint
        self.sha256Thumbprint = sha256Thumbprint
        self.subject = subject
        self.validFrom = validFrom
        self.validTo = validTo
    }

    
}
