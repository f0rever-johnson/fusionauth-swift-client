//
//  ThemeRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct ThemeRequest:Codable{
    public var sourceThemeIOd:UUID? = nil
    public var theme:Theme? = nil

    public init(sourceThemeIOd: UUID? = nil, theme: Theme? = nil) {
        self.sourceThemeIOd = sourceThemeIOd
        self.theme = theme
    }

}
