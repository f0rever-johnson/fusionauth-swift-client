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

    public var applicationId:UUID?
    public var authenticationToken:String?
    public var cleanSpeakId:UUID?
    public var data:[String:JSONObject]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastLoginInstant:Date?
    public var preferredLanguages:[String]?
    public var roles:[String]?
    public var timezone:String?
    public var tokens:[String:String]?
    public var username:String?
    public var usernameStatus:ContentStatus?
    public var verified:Bool?

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
