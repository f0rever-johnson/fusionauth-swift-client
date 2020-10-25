//
//  CertificateInformation.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class CertificateInformation:Codable{
    
    public var issuer:String? = nil
    public var md5Fingerprint:String? = nil
    public var serialNumber:String? = nil
    public var sha1Fingerprint:String? = nil
    public var sha1Thumbprint:String? = nil
    public var sha256Fingerprint:String? = nil
    public var sha256Thumbprint:String? = nil
    public var subject:String? = nil
    public var validFrom:Date? = nil
    public var validTo:Date? = nil

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
