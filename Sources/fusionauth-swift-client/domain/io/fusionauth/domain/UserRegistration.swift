//
//  UserRegistration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Registration Object
 */

public class UserRegistration:Codable {

    public var applicationId:UUID? = nil
    public var authenticationToken:String? = nil
    public var cleanSpeakId:UUID? = nil
    public var data:[String:JSONObject]? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastLoginInstant:Date? = nil
    public var preferredLanguages:[String]? = nil
    public var roles:[String]? = nil
    public var timezone:String? = nil
    public var tokens:[String:String]? = nil
    public var username:String? = nil
    public var usernameStatus:ContentStatus? = nil
    public var verified:Bool? = nil

    public init(applicationId: UUID? = nil, authenticationToken: String? = nil, cleanSpeakId: UUID? = nil, data: [String:JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastLoginInstant: Date? = nil, preferredLanguages: [String]? = nil, roles: [String]? = nil, timezone: String? = nil, tokens: [String:String]? = nil, username: String? = nil, usernameStatus: ContentStatus? = nil, verified: Bool? = nil) {
        self.applicationId = applicationId
        self.authenticationToken = authenticationToken
        self.cleanSpeakId = cleanSpeakId
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.lastLoginInstant = lastLoginInstant
        self.preferredLanguages = preferredLanguages
        self.roles = roles
        self.timezone = timezone
        self.tokens = tokens
        self.username = username
        self.usernameStatus = usernameStatus
        self.verified = verified
    }

}
