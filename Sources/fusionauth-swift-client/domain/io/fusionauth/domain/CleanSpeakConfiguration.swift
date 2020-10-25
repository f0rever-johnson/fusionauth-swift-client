//
//  CleanSpeakConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Clean Speak Configuration Object.
 */

public class CleanSpeakConfiguration:Codable, Enableable {
    public var apiKey:String? = nil
    public var applicationIds:[UUID]? = nil
    public var url:URL? = nil
    public var usernameModeration:UsernameModeration? = nil
    public var enabled:Bool? = nil

    public init(apiKey: String? = nil, applicationIds: [UUID]? = nil, url: URL? = nil, usernameModeration: UsernameModeration? = nil, enabled: Bool? = nil) {
        self.apiKey = apiKey
        self.applicationIds = applicationIds
        self.url = url
        self.usernameModeration = usernameModeration
        self.enabled = enabled
    }

}

