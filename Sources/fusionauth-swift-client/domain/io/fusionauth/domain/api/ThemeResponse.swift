//
//  ThemeResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct ThemeResponse:Codable{
    public var theme:Theme?
    public var themes:[Theme]?

    public init(theme: Theme? = nil, themes: [Theme]? = nil) {
        self.theme = theme
        self.themes = themes
    }

}
