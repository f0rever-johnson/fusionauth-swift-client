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
    public var headerColor:String? = nil
    public var logoURL:String? = nil
    public var menuFontColor:String? = nil

    public init(headerColor: String? = nil, logoURL: String? = nil, menuFontColor: String? = nil) {
        self.headerColor = headerColor
        self.logoURL = logoURL
        self.menuFontColor = menuFontColor
    }
}
