//
//  GenericConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class GenericConnectorConfiguration:BaseConnectorConfiguration{
    public init(authenticationURL: String, connectTimeout: Int? = nil, headers: HTTPHeaders, httpAuthenticationPassword: String, httpAuthenticationUsername: String, readTimeout: Int? = nil, sslCertificateKeyId: UUID? = nil) {
        self.authenticationURL = authenticationURL
        self.connectTimeout = connectTimeout
        self.headers = headers
        self.httpAuthenticationPassword = httpAuthenticationPassword
        self.httpAuthenticationUsername = httpAuthenticationUsername
        self.readTimeout = readTimeout
        self.sslCertificateKeyId = sslCertificateKeyId
    }
    
    public var authenticationURL:String
    public var connectTimeout:Int?
    public var headers:HTTPHeaders
    public var httpAuthenticationPassword:String
    public var httpAuthenticationUsername:String
    public var readTimeout:Int?
    public var sslCertificateKeyId:UUID?
}
