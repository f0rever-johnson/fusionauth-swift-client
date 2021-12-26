//
//  UIConfigurations.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a UIConfiguration Object.
 */

public struct UIConfiguration:Codable{
    public var headerColor:String?
    public var logoURL:String?
    public var menuFontColor:String?

    public init(headerColor: String? = nil, logoURL: String? = nil, menuFontColor: String? = nil) {
        self.headerColor = headerColor
        self.logoURL = logoURL
        self.menuFontColor = menuFontColor
    }
}
