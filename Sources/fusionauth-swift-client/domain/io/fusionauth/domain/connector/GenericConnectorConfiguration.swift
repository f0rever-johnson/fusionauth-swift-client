//
//  GenericConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class GenericConnectorConfiguration:BaseConnectorConfiguration{
    
    public var authenticationURL:String?
    public var connectTimeout:Int?
    public var headers:HTTPHeaders?
    public var httpAuthenticationPassword:String?
    public var httpAuthenticationUsername:String?
    public var readTimeout:Int?
    public var sslCertificateKeyId:UUID?
    
    public init(authenticationURL: String? = nil, connectTimeout: Int? = nil, data: JSONObject? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: ConnectorType? = nil, headers: HTTPHeaders? = nil, httpAuthenticationPassword: String? = nil, httpAuthenticationUsername: String? = nil, readTimeout: Int? = nil, sslCertificateKeyId: UUID? = nil) {
        self.authenticationURL = authenticationURL
        self.connectTimeout = connectTimeout
        self.headers = headers
        self.httpAuthenticationPassword = httpAuthenticationPassword
        self.httpAuthenticationUsername = httpAuthenticationUsername
        self.readTimeout = readTimeout
        self.sslCertificateKeyId = sslCertificateKeyId
        super.init(data: data, debug: debug, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, type: type)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticationURL = try container.decode(String.self, forKey: .authenticationURL)
        self.connectTimeout = try container.decode(Int.self, forKey: .connectTimeout)
        self.headers = try container.decode(HTTPHeaders.self, forKey: .headers)
        self.httpAuthenticationPassword = try container.decode(String.self, forKey: .httpAuthenticationPassword)
        self.httpAuthenticationUsername = try container.decode(String.self, forKey: .httpAuthenticationUsername)
        self.readTimeout = try container.decode(Int.self, forKey: .readTimeout)
        self.sslCertificateKeyId = try container.decode(UUID.self, forKey: .sslCerificateKeyId)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case authenticationURL
        case connectTimeout
        case headers
        case httpAuthenticationPassword
        case httpAuthenticationUsername
        case readTimeout
        case sslCerificateKeyId
    }

   
}
