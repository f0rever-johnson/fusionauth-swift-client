//
//  ThemeResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct ThemeResponse:Codable{
    public var theme:Theme? = nil
    public var themes:[Theme]? = nil

    public init(theme: Theme? = nil, themes: [Theme]? = nil) {
        self.theme = theme
        self.themes = themes
    }

}
