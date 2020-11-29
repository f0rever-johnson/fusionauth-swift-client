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

public class User:SecureIdentity, Codable{
    public var encryptionScheme: String? = nil
    public var factor: Int? = nil
    public var id: UUID? = nil
    public var password: String? = nil
    public var passwordChangeRequired: Bool? = nil
    public var passwordLastUpdateInstant: Date? = nil
    public var salt: String? = nil
    public var verified: Bool? = nil
    public var active:Bool? = nil
    public var birthDate:String? = nil
    public var cleanSpeakId:UUID? = nil
    public var data:[String:JSONObject]? = nil
    public var email:String? = nil
    public var expiry:Date? = nil
    public var firstName:String? = nil
    public var fullName:String? = nil
    public var imageUrl:String? = nil
    public var insertInstant:Date? = nil
    public var lastLoginInstant:Date? = nil
    public var lastName:String? = nil
    public var memberships:[GroupMember]? = nil
    public var middleName:String? = nil
    public var mobilePhone:String? = nil
    public var parentEmail:String? = nil
    public var preferredLanguages:[String]? = nil
    public var registrations:[UserRegistration]? = nil
    public var tenantId:UUID? = nil
    public var timezone:String? = nil
    public var twoFactorDelivery:TwoFactorDelivery? = nil
    public var twoFactorEnabled:Bool? = nil
    public var twoFactorSecret:String? = nil
    public var username:String? = nil
    public var usernameStatus:ContentStatus? = nil

    public init(encryptionScheme:String? = nil, factor: Int? = nil, id: UUID? = nil, password: String? = nil, passwordChangeRequired: Bool? = nil, passwordLastUpdateInstant: Date? = nil, salt: String? = nil, verified: Bool? = nil, active: Bool? = nil, birthDate: String? = nil, cleanSpeakId: UUID? = nil, data: [String:JSONObject]? = nil, email: String? = nil, expiry: Date? = nil, firstName: String? = nil, fullName: String? = nil, imageUrl: String? = nil, insertInstant: Date? = nil, lastLoginInstant: Date? = nil, lastName: String? = nil, memberships: [GroupMember]? = nil, middleName: String? = nil, mobilePhone: String? = nil, parentEmail: String? = nil, preferredLanguages: [String]? = nil, registrations: [UserRegistration]? = nil, tenantId: UUID? = nil, timezone: String? = nil, twoFactorDelivery: TwoFactorDelivery? = nil, twoFactorEnabled: Bool? = nil, twoFactorSecret: String? = nil, username: String? = nil, usernameStatus: ContentStatus? = nil) {
        self.encryptionScheme = encryptionScheme
        self.factor = factor
        self.id = id
        self.password = password
        self.passwordChangeRequired = passwordChangeRequired
        self.passwordLastUpdateInstant = passwordLastUpdateInstant
        self.salt = salt
        self.verified = verified
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
        self.lastLoginInstant = lastLoginInstant
        self.lastName = lastName
        self.memberships = memberships
        self.middleName = middleName
        self.mobilePhone = mobilePhone
        self.parentEmail = parentEmail
        self.preferredLanguages = preferredLanguages
        self.registrations = registrations
        self.tenantId = tenantId
        self.timezone = timezone
        self.twoFactorDelivery = twoFactorDelivery
        self.twoFactorEnabled = twoFactorEnabled
        self.twoFactorSecret = twoFactorSecret
        self.username = username
        self.usernameStatus = usernameStatus
    }
}
