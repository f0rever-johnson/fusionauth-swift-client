//
//  ExternalIdentifierConfiguration.swift
// 
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new External Identifier Configuration Object.
 */

public struct ExternalIdentifierConfiguration:Codable {
    public var authorizationGrantIdTimeToLiveInSeconds:Int? = nil
    public var changePasswordIdGenerator:SecureGeneratorConfiguration? = nil
    public var changePasswordIdTimeToLiveInSeconds:Int? = nil
    public var deviceCodeTimeToLiveinSeconds:Int? = nil
    public var deviceUserCodeIdGenerator:SecureGeneratorConfiguration? = nil
    public var emailVerificationIdGenerator:SecureGeneratorConfiguration? = nil
    public var emailVerificationIdTimeToLiveInSeconds:Int? = nil
    public var oneTimePasswordTimeToLiveInSeconds:Int? = nil
    public var passwordlessLoginGenerator:SecureGeneratorConfiguration? = nil
    public var passwordlessLoginTimeToLiveInSeconds:Int? = nil
    public var registrationVerificationIdGenerator:SecureGeneratorConfiguration? = nil
    public var registrationVerificationIdTimeToLiveInSeconds:Int? = nil
    public var setupPasswordIdGenerator:SecureGeneratorConfiguration? = nil
    public var setupPasswordIdTimeToLiveInSeconds:Int? = nil
    public var twoFactorIdTimeToLiveInSeconds:Int? = nil
    public var twoFactorTrustIdTimeToLiveInSeconds:Int? = nil

    public init(authorizationGrantIdTimeToLiveInSeconds: Int? = nil, changePasswordIdGenerator: SecureGeneratorConfiguration? = nil, changePasswordIdTimeToLiveInSeconds: Int? = nil, deviceCodeTimeToLiveinSeconds: Int? = nil, deviceUserCodeIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdTimeToLiveInSeconds: Int? = nil, oneTimePasswordTimeToLiveInSeconds: Int? = nil, passwordlessLoginGenerator: SecureGeneratorConfiguration? = nil, passwordlessLoginTimeToLiveInSeconds: Int? = nil, registrationVerificationIdGenerator: SecureGeneratorConfiguration? = nil, registrationVerificationIdTimeToLiveInSeconds: Int? = nil, setupPasswordIdGenerator: SecureGeneratorConfiguration? = nil, setupPasswordIdTimeToLiveInSeconds: Int? = nil, twoFactorIdTimeToLiveInSeconds: Int? = nil, twoFactorTrustIdTimeToLiveInSeconds: Int? = nil) {
        self.authorizationGrantIdTimeToLiveInSeconds = authorizationGrantIdTimeToLiveInSeconds
        self.changePasswordIdGenerator = changePasswordIdGenerator
        self.changePasswordIdTimeToLiveInSeconds = changePasswordIdTimeToLiveInSeconds
        self.deviceCodeTimeToLiveinSeconds = deviceCodeTimeToLiveinSeconds
        self.deviceUserCodeIdGenerator = deviceUserCodeIdGenerator
        self.emailVerificationIdGenerator = emailVerificationIdGenerator
        self.emailVerificationIdTimeToLiveInSeconds = emailVerificationIdTimeToLiveInSeconds
        self.oneTimePasswordTimeToLiveInSeconds = oneTimePasswordTimeToLiveInSeconds
        self.passwordlessLoginGenerator = passwordlessLoginGenerator
        self.passwordlessLoginTimeToLiveInSeconds = passwordlessLoginTimeToLiveInSeconds
        self.registrationVerificationIdGenerator = registrationVerificationIdGenerator
        self.registrationVerificationIdTimeToLiveInSeconds = registrationVerificationIdTimeToLiveInSeconds
        self.setupPasswordIdGenerator = setupPasswordIdGenerator
        self.setupPasswordIdTimeToLiveInSeconds = setupPasswordIdTimeToLiveInSeconds
        self.twoFactorIdTimeToLiveInSeconds = twoFactorIdTimeToLiveInSeconds
        self.twoFactorTrustIdTimeToLiveInSeconds = twoFactorTrustIdTimeToLiveInSeconds
    }

}
