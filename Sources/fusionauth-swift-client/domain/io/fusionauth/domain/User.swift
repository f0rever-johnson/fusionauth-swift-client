//
//  User.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Object
 */

public class User:SecureIdentity{
    
    public var active:Bool?
    public var birthDate:String?
    public var cleanSpeakId:UUID?
    public var data:[String:JSONObject]?
    public var email:String?
    public var expiry:Date?
    public var firstName:String?
    public var fullName:String?
    public var imageUrl:String?
    public var insertInstant:Date?
    public var lastName:String?
    public var lastUpdateInstant:Date?
    public var memberships:[GroupMember]?
    public var middleName:String?
    public var mobilePhone:String?
    public var parentEmail:String?
    public var preferredLanguages:[String]?
    public var registrations:[UserRegistration]?
    public var tenantId:UUID?
    public var timezone:String?
    public var twoFactor:UserTwoFactorConfiguration?
    
    
    //Required by SecureIdentity Protocol
    public var breachedPasswordLastCheckedInstant:Date?
    public var breachedPasswordStatus:BreachedPasswordStatus?
    public var connectorId:UUID?
    public var encryptionScheme:String?
    public var factor:Int?
    public var id:UUID?
    public var lastLoginInstant:Date?
    public var password:String?
    public var passwordChangeReason:ChangePasswordReason?
    public var passwordChangedRequired:Bool?
    public var passwordLastUpdateInstant:Date?
    public var salt:String?
    public var uniqueUsername: String?
    public var twoFactorEnabled:Bool?
    public var twoFactorSecret:String?
    public var username:String?
    public var usernameStatus:ContentStatus?
    public var verified:Bool?

    public init(active: Bool? = nil, birthDate: String? = nil, cleanSpeakId: UUID? = nil, data: [String : JSONObject]? = nil, email: String? = nil, expiry: Date? = nil, firstName: String? = nil, fullName: String? = nil, imageUrl: String? = nil, insertInstant: Date? = nil, lastName: String? = nil, lastUpdateInstant: Date? = nil, memberships: [GroupMember]? = nil, middleName: String? = nil, mobilePhone: String? = nil, parentEmail: String? = nil, preferredLanguages: [String]? = nil, registrations: [UserRegistration]? = nil, tenantId: UUID? = nil, timezone: String? = nil, twoFactor: UserTwoFactorConfiguration? = nil, breachedPasswordLastCheckedInstant: Date? = nil, breachedPasswordStatus: BreachedPasswordStatus? = nil, connectorId: UUID? = nil, encryptionScheme: String? = nil, factor: Int? = nil, id: UUID? = nil, lastLoginInstant: Date? = nil, password: String? = nil, passwordChangeReason: ChangePasswordReason? = nil, passwordChangedRequired: Bool? = nil, passwordLastUpdateInstant: Date? = nil, salt: String? = nil, uniqueUsername: String? = nil, twoFactorEnabled: Bool? = nil, twoFactorSecret: String? = nil, username: String? = nil, usernameStatus: ContentStatus? = nil, verified: Bool? = nil) {
        self.active = active
        self.birthDate = birthDate
        self.cleanSpeakId = cleanSpeakId
        self.data = data
        self.email = email
        self.expiry = expiry
        self.firstName = firstName
        self.fullName = fullName
        self.imageUrl = imageUrl
        self.insertInstant = insertInstant
        self.lastName = lastName
        self.lastUpdateInstant = lastUpdateInstant
        self.memberships = memberships
        self.middleName = middleName
        self.mobilePhone = mobilePhone
        self.parentEmail = parentEmail
        self.preferredLanguages = preferredLanguages
        self.registrations = registrations
        self.tenantId = tenantId
        self.timezone = timezone
        self.twoFactor = twoFactor
        self.breachedPasswordLastCheckedInstant = breachedPasswordLastCheckedInstant
        self.breachedPasswordStatus = breachedPasswordStatus
        self.connectorId = connectorId
        self.encryptionScheme = encryptionScheme
        self.factor = factor
        self.id = id
        self.lastLoginInstant = lastLoginInstant
        self.password = password
        self.passwordChangeReason = passwordChangeReason
        self.passwordChangedRequired = passwordChangedRequired
        self.passwordLastUpdateInstant = passwordLastUpdateInstant
        self.salt = salt
        self.uniqueUsername = uniqueUsername
        self.twoFactorEnabled = twoFactorEnabled
        self.twoFactorSecret = twoFactorSecret
        self.username = username
        self.usernameStatus = usernameStatus
        self.verified = verified
    }
}
