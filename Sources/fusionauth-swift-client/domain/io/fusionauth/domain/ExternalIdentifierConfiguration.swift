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

public class ExternalIdentifierConfiguration:Codable {
    
    public var authorizationGrantIdTimeToLiveInSeconds:Int?
    public var changePasswordIdGenerator:SecureGeneratorConfiguration?
    public var changePasswordIdTimeToLiveInSeconds:Int?
    public var deviceCodeTimeToLiveInSeconds:Int?
    public var deviceUserCodeIdGenerator:SecureGeneratorConfiguration?
    public var emailVerificationIdGenerator:SecureGeneratorConfiguration?
    public var emailVerificationIdTimeToLiveInSeconds:Int?
    public var emailVerificationOneTimeCodeGenerator:SecureGeneratorConfiguration?
    public var externalAuthenticationIdTimeToLiveInSeconds:Int?
    public var oneTimePasswordTimeToLiveInSeconds:Int?
    public var passwordlessLoginGenerator:SecureGeneratorConfiguration?
    public var passwordlessLoginTimeToLiveInSeconds:Int?
    public var pendingAccountLinkTimeToLiveInSeconds:Int?
    public var registrationVerificationIdGenerator:SecureGeneratorConfiguration?
    public var registrationVerificationIdTimeToLiveInSeconds:Int?
    public var registrationVerificationOneTimeCodeGenerator:SecureGeneratorConfiguration?
    public var samlv2AuthNRequestIdTimeToLiveInSeconds:Int?
    public var setupPasswordIdGenerator:SecureGeneratorConfiguration?
    public var setupPasswordIdTimeToLiveInSeconds:Int?
    public var trustTokenTimeToLiveInSeconds:Int?
    public var twoFactorIdTimeToLiveInSeconds:Int?
    public var twoFactorOneTimeCodeIdGenerator:SecureGeneratorConfiguration?
    public var twoFactorOneTimeCodeIdTimeToLiveInSeconds:Int?
    public var twoFactorTrustIdTimeToLiveInSeconds:Int?
    
    public init(authorizationGrantIdTimeToLiveInSeconds: Int? = nil, changePasswordIdGenerator: SecureGeneratorConfiguration? = nil, changePasswordIdTimeToLiveInSeconds: Int? = nil, deviceCodeTimeToLiveInSeconds: Int? = nil, deviceUserCodeIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdTimeToLiveInSeconds: Int? = nil, emailVerificationOneTimeCodeGenerator: SecureGeneratorConfiguration? = nil, externalAuthenticationIdTimeToLiveInSeconds: Int? = nil, oneTimePasswordTimeToLiveInSeconds: Int? = nil, passwordlessLoginGenerator: SecureGeneratorConfiguration? = nil, passwordlessLoginTimeToLiveInSeconds: Int? = nil, pendingAccountLinkTimeToLiveInSeconds: Int? = nil, registrationVerificationIdGenerator: SecureGeneratorConfiguration? = nil, registrationVerificationIdTimeToLiveInSeconds: Int? = nil, registrationVerificationOneTimeCodeGenerator: SecureGeneratorConfiguration? = nil, samlv2AuthNRequestIdTimeToLiveInSeconds: Int? = nil, setupPasswordIdGenerator: SecureGeneratorConfiguration? = nil, setupPasswordIdTimeToLiveInSeconds: Int? = nil, trustTokenTimeToLiveInSeconds: Int? = nil, twoFactorIdTimeToLiveInSeconds: Int? = nil, twoFactorOneTimeCodeIdGenerator: SecureGeneratorConfiguration? = nil, twoFactorOneTimeCodeIdTimeToLiveInSeconds: Int? = nil, twoFactorTrustIdTimeToLiveInSeconds: Int? = nil) {
        self.authorizationGrantIdTimeToLiveInSeconds = authorizationGrantIdTimeToLiveInSeconds
        self.changePasswordIdGenerator = changePasswordIdGenerator
        self.changePasswordIdTimeToLiveInSeconds = changePasswordIdTimeToLiveInSeconds
        self.deviceCodeTimeToLiveInSeconds = deviceCodeTimeToLiveInSeconds
        self.deviceUserCodeIdGenerator = deviceUserCodeIdGenerator
        self.emailVerificationIdGenerator = emailVerificationIdGenerator
        self.emailVerificationIdTimeToLiveInSeconds = emailVerificationIdTimeToLiveInSeconds
        self.emailVerificationOneTimeCodeGenerator = emailVerificationOneTimeCodeGenerator
        self.externalAuthenticationIdTimeToLiveInSeconds = externalAuthenticationIdTimeToLiveInSeconds
        self.oneTimePasswordTimeToLiveInSeconds = oneTimePasswordTimeToLiveInSeconds
        self.passwordlessLoginGenerator = passwordlessLoginGenerator
        self.passwordlessLoginTimeToLiveInSeconds = passwordlessLoginTimeToLiveInSeconds
        self.pendingAccountLinkTimeToLiveInSeconds = pendingAccountLinkTimeToLiveInSeconds
        self.registrationVerificationIdGenerator = registrationVerificationIdGenerator
        self.registrationVerificationIdTimeToLiveInSeconds = registrationVerificationIdTimeToLiveInSeconds
        self.registrationVerificationOneTimeCodeGenerator = registrationVerificationOneTimeCodeGenerator
        self.samlv2AuthNRequestIdTimeToLiveInSeconds = samlv2AuthNRequestIdTimeToLiveInSeconds
        self.setupPasswordIdGenerator = setupPasswordIdGenerator
        self.setupPasswordIdTimeToLiveInSeconds = setupPasswordIdTimeToLiveInSeconds
        self.trustTokenTimeToLiveInSeconds = trustTokenTimeToLiveInSeconds
        self.twoFactorIdTimeToLiveInSeconds = twoFactorIdTimeToLiveInSeconds
        self.twoFactorOneTimeCodeIdGenerator = twoFactorOneTimeCodeIdGenerator
        self.twoFactorOneTimeCodeIdTimeToLiveInSeconds = twoFactorOneTimeCodeIdTimeToLiveInSeconds
        self.twoFactorTrustIdTimeToLiveInSeconds = twoFactorTrustIdTimeToLiveInSeconds
    }

}
