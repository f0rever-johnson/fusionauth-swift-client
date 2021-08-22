//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class GenericMessengerConfiguration:BaseMessengerConfiguration{
    
    public var connectTimeout:Int? = nil
    public var headers:HTTPHeaders? = nil
    public var httpAuthenticationPassword:String? = nil
    public var httpAuthenticationUsername:String? = nil
    public var readTimeout:Int? = nil
    public var sslCertificate:String? = nil
    public var url:String? = nil
    
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


    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.connectTimeout = try container.decode(Int.self, forKey: .connectTimeout)
        self.headers = try container.decode(HTTPHeaders.self, forKey: .headers)
        self.httpAuthenticationPassword = try container.decode(String.self, forKey: .httpAuthenticationPassword)
        self.readTimeout = try container.decode(Int.self, forKey: .readTimeout)
        self.sslCertificate = try container.decode(String.self, forKey: .sslCerificate)
        self.url = try container.decode(String.self, forKey: .url)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    public enum CodingKeys:CodingKey{
        case connectTimeout
        case headers
        case httpAuthenticationPassword
        case httpAuthenticationUsername
        case readTimeout
        case sslCerificate
        case url
    }
}
