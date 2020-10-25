//
//  ThemeRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
