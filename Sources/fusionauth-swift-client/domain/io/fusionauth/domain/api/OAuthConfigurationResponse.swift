//
//  OAuthConfigurationResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct OAuthConfigurationResponse:Codable {
    public var hhttpSessionMaxInactiveInterval:Int? = nil
    public var logoutURL:URL? = nil
    public var oauthConfiguration:OAuth2Configuration? = nil

    public init(hhttpSessionMaxInactiveInterval: Int? = nil, logoutURL: URL? = nil, oauthConfiguration: OAuth2Configuration? = nil) {
        self.hhttpSessionMaxInactiveInterval = hhttpSessionMaxInactiveInterval
        self.logoutURL = logoutURL
        self.oauthConfiguration = oauthConfiguration
    }

}
