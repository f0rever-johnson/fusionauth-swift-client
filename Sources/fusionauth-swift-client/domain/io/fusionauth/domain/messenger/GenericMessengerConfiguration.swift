//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class GenericMessengerConfiguration:BaseMessengerConfigurationProtocol{
    
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertInstant: Date? = nil
    public var lastUpdateInstant: Date? = nil
    public var name: String? = nil
    public var transport: String? = nil
    public var type: MessengerType? = nil
    public var connectTimeout:Int? = nil
    public var headers:HTTPHeaders? = nil
    public var httpAuthenticationPassword:String? = nil
    public var httpAuthenticationUsername:String? = nil
    public var readTimeout:Int? = nil
    public var sslCertificate:String? = nil
    public var url:String? = nil
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, connectTimeout: Int? = nil, headers: HTTPHeaders? = nil, httpAuthenticationPassword: String? = nil, httpAuthenticationUsername: String? = nil, readTimeout: Int? = nil, sslCertificate: String? = nil, url: String? = nil) {
        self.data = data
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.transport = transport
        self.type = type
        self.connectTimeout = connectTimeout
        self.headers = headers
        self.httpAuthenticationPassword = httpAuthenticationPassword
        self.httpAuthenticationUsername = httpAuthenticationUsername
        self.readTimeout = readTimeout
        self.sslCertificate = sslCertificate
        self.url = url
    }


}
