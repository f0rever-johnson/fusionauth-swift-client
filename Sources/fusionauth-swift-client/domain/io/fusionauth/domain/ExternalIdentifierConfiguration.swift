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
    
    public var authorizationGrantIdTimeToLiveInSeconds:Int? = nil
    public var changePasswordIdGenerator:SecureGeneratorConfiguration? = nil
    public var changePasswordIdTimeToLiveInSeconds:Int? = nil
    public var deviceCodeTimeToLiveInSeconds:Int? = nil
    public var deviceUserCodeIdGenerator:SecureGeneratorConfiguration? = nil
    public var emailVerificationIdGenerator:SecureGeneratorConfiguration? = nil
    public var emailVerificationIdTimeToLiveInSeconds:Int? = nil
    public var emailVerificationOneTimeCodeGenerator:SecureGeneratorConfiguration? = nil
    public var externalAuthenticationIdTimeToLiveInSeconds:Int? = nil
    public var oneTimePasswordTimeToLiveInSeconds:Int? = nil
    public var passwordlessLoginGenerator:SecureGeneratorConfiguration? = nil
    public var passwordlessLoginTimeToLiveInSeconds:Int? = nil
    public var pendingAccountLinkTimeToLiveInSeconds:Int? = nil
    public var registrationVerificationIdGenerator:SecureGeneratorConfiguration? = nil
    public var registrationVerificationIdTimeToLiveInSeconds:Int? = nil
    public var registrationVerificationOneTimeCodeGenerator:SecureGeneratorConfiguration? = nil
    public var samlv2AuthNRequestIdTimeToLiveInSeconds:Int? = nil
    public var setupPasswordIdGenerator:SecureGeneratorConfiguration? = nil
    public var setupPasswordIdTimeToLiveInSeconds:Int? = nil
    public var twoFactorIdTimeToLiveInSeconds:Int? = nil
    public var twoFactorOneTimeCodeIdGenerator:SecureGeneratorConfiguration? = nil
    public var twoFactorOneTimeCodeIdTimeToLiveInSeconds:Int? = nil
    public var twoFactorTrustIdTimeToLiveInSeconds:Int? = nil
    
    public init(authorizationGrantIdTimeToLiveInSeconds: Int? = nil, changePasswordIdGenerator: SecureGeneratorConfiguration? = nil, changePasswordIdTimeToLiveInSeconds: Int? = nil, deviceCodeTimeToLiveInSeconds: Int? = nil, deviceUserCodeIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdGenerator: SecureGeneratorConfiguration? = nil, emailVerificationIdTimeToLiveInSeconds: Int? = nil, emailVerificationOneTimeCodeGenerator: SecureGeneratorConfiguration? = nil, externalAuthenticationIdTimeToLiveInSeconds: Int? = nil, oneTimePasswordTimeToLiveInSeconds: Int? = nil, passwordlessLoginGenerator: SecureGeneratorConfiguration? = nil, passwordlessLoginTimeToLiveInSeconds: Int? = nil, pendingAccountLinkTimeToLiveInSeconds: Int? = nil, registrationVerificationIdGenerator: SecureGeneratorConfiguration? = nil, registrationVerificationIdTimeToLiveInSeconds: Int? = nil, registrationVerificationOneTimeCodeGenerator: SecureGeneratorConfiguration? = nil, samlv2AuthNRequestIdTimeToLiveInSeconds: Int? = nil, setupPasswordIdGenerator: SecureGeneratorConfiguration? = nil, setupPasswordIdTimeToLiveInSeconds: Int? = nil, twoFactorIdTimeToLiveInSeconds: Int? = nil, twoFactorOneTimeCodeIdGenerator: SecureGeneratorConfiguration? = nil, twoFactorOneTimeCodeIdTimeToLiveInSeconds: Int? = nil, twoFactorTrustIdTimeToLiveInSeconds: Int? = nil) {
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
        self.twoFactorIdTimeToLiveInSeconds = twoFactorIdTimeToLiveInSeconds
        self.twoFactorOneTimeCodeIdGenerator = twoFactorOneTimeCodeIdGenerator
        self.twoFactorOneTimeCodeIdTimeToLiveInSeconds = twoFactorOneTimeCodeIdTimeToLiveInSeconds
        self.twoFactorTrustIdTimeToLiveInSeconds = twoFactorTrustIdTimeToLiveInSeconds
    }
    

    
}
