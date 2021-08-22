//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class ReactorStatus:Codable{
    
    public var advancedIdentityProviders:ReactorFeatureStatus?
    public var advancedMultiFactorAuthentication:ReactorFeatureStatus?
    public var advancedRegistration:ReactorFeatureStatus?
    public var applicationThemes:ReactorFeatureStatus?
    public var breachedPasswordDetection:ReactorFeatureStatus?
    public var connectors:ReactorFeatureStatus?
    public var entityManagement:ReactorFeatureStatus?
    public var licensed:Bool?
    public var threatDetection:ReactorFeatureStatus?
    
    public init(advancedIdentityProviders: ReactorFeatureStatus? = nil, advancedMultiFactorAuthentication: ReactorFeatureStatus? = nil, advancedRegistration: ReactorFeatureStatus? = nil, applicationThemes: ReactorFeatureStatus? = nil, breachedPasswordDetection: ReactorFeatureStatus? = nil, connectors: ReactorFeatureStatus? = nil, entityManagement: ReactorFeatureStatus? = nil, licensed: Bool? = nil, threatDetection: ReactorFeatureStatus? = nil) {
        self.advancedIdentityProviders = advancedIdentityProviders
        self.advancedMultiFactorAuthentication = advancedMultiFactorAuthentication
        self.advancedRegistration = advancedRegistration
        self.applicationThemes = applicationThemes
        self.breachedPasswordDetection = breachedPasswordDetection
        self.connectors = connectors
        self.entityManagement = entityManagement
        self.licensed = licensed
        self.threatDetection = threatDetection
    }


}
