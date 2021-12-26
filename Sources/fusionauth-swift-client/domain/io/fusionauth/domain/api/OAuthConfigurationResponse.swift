//
//  OAuthConfigurationResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct OAuthConfigurationResponse:Codable {
    public var hhttpSessionMaxInactiveInterval:Int?
    public var logoutURL:URL?
    public var oauthConfiguration:OAuth2Configuration?

    public init(hhttpSessionMaxInactiveInterval: Int? = nil, logoutURL: URL? = nil, oauthConfiguration: OAuth2Configuration? = nil) {
        self.hhttpSessionMaxInactiveInterval = hhttpSessionMaxInactiveInterval
        self.logoutURL = logoutURL
        self.oauthConfiguration = oauthConfiguration
    }

}
