//
//  PasswordlessConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class PasswordlessConfiguration:Enableable, Codable{
    public var enabled: Bool? = nil

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }

}
