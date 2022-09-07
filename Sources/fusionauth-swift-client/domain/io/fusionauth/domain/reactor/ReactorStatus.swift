//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class ReactorStatus:Codable{

    public var advancedIdentityProviders:ReactorFeatureStatus?
    public var advancedLambdas:ReactorFeatureStatus?
    public var advancedMultiFactorAuthentication:ReactorFeatureStatus?
    public var advancedRegistration:ReactorFeatureStatus?
    public var applicationMultiFactorAuthentication:ReactorFeatureStatus?
    public var applicationThemes:ReactorFeatureStatus?
    public var breachedPasswordDetection:ReactorFeatureStatus?
    public var connectors:ReactorFeatureStatus?
    public var entityManagement:ReactorFeatureStatus?
    public var expiration:String?
    public var licenseAttributes:[String:String]?
    public var licensed:Bool?
    public var scimServer:ReactorFeatureStatus?
    public var threatDetection:ReactorFeatureStatus?
    
    public init(advancedIdentityProviders: ReactorFeatureStatus? = nil, advancedLambdas: ReactorFeatureStatus? = nil, advancedMultiFactorAuthentication: ReactorFeatureStatus? = nil, advancedRegistration: ReactorFeatureStatus? = nil, applicationMultiFactorAuthentication: ReactorFeatureStatus? = nil, applicationThemes: ReactorFeatureStatus? = nil, breachedPasswordDetection: ReactorFeatureStatus? = nil, connectors: ReactorFeatureStatus? = nil, entityManagement: ReactorFeatureStatus? = nil, expiration: String? = nil, licenseAttributes: [String : String]? = nil, licensed: Bool? = nil, scimServer: ReactorFeatureStatus? = nil, threatDetection: ReactorFeatureStatus? = nil) {
        self.advancedIdentityProviders = advancedIdentityProviders
        self.advancedLambdas = advancedLambdas
        self.advancedMultiFactorAuthentication = advancedMultiFactorAuthentication
        self.advancedRegistration = advancedRegistration
        self.applicationMultiFactorAuthentication = applicationMultiFactorAuthentication
        self.applicationThemes = applicationThemes
        self.breachedPasswordDetection = breachedPasswordDetection
        self.connectors = connectors
        self.entityManagement = entityManagement
        self.expiration = expiration
        self.licenseAttributes = licenseAttributes
        self.licensed = licensed
        self.scimServer = scimServer
        self.threatDetection = threatDetection
    }
}
