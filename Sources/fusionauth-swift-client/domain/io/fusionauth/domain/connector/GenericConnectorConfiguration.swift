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

   
}
