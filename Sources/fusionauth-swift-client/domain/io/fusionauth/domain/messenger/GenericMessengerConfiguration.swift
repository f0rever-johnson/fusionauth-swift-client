//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class GenericMessengerConfiguration:BaseMessengerConfiguration{
    
    public var connectTimeout:Int?
    public var headers:HTTPHeaders?
    public var httpAuthenticationPassword:String?
    public var httpAuthenticationUsername:String?
    public var readTimeout:Int?
    public var sslCertificate:String?
    public var url:String?
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, connectTimeout: Int? = nil, headers: HTTPHeaders? = nil, httpAuthenticationPassword: String? = nil, httpAuthenticationUsername: String? = nil, readTimeout: Int? = nil, sslCertificate: String? = nil, url: String? = nil) {
        self.connectTimeout = connectTimeout
        self.headers = headers
        self.httpAuthenticationPassword = httpAuthenticationPassword
        self.httpAuthenticationUsername = httpAuthenticationUsername
        self.readTimeout = readTimeout
        self.sslCertificate = sslCertificate
        self.url = url
        super.init(data: data, debug: debug, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, transport: transport, type: type)
    }


    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.connectTimeout = try container.decode(Int.self, forKey: .connectTimeout)
        self.headers = try container.decode(HTTPHeaders.self, forKey: .headers)
        self.httpAuthenticationPassword = try container.decode(String.self, forKey: .httpAuthenticationPassword)
        self.readTimeout = try container.decode(Int.self, forKey: .readTimeout)
        self.sslCertificate = try container.decode(String.self, forKey: .sslCertificate)
        self.url = try container.decode(String.self, forKey: .url)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
  
        
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(connectTimeout, forKey: .connectTimeout)
        try container.encode(headers, forKey: .headers)
        try container.encode(httpAuthenticationPassword, forKey: .httpAuthenticationPassword)
        try container.encode(httpAuthenticationUsername, forKey: .httpAuthenticationUsername)
        try container.encode(readTimeout, forKey: .readTimeout)
        try container.encode(sslCertificate, forKey: .sslCertificate)
        try container.encode(url, forKey: .url)
        
        try super.encode(to: encoder)
    }

    
    private enum CodingKeys:CodingKey{
        case connectTimeout
        case headers
        case httpAuthenticationPassword
        case httpAuthenticationUsername
        case readTimeout
        case sslCertificate
        case url
    }
    
}
