//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class ReactorStatus:Codable{

    public var advancedIdentityProviders:ReactorFeatureStatus? = nil
    public var advancedMultiFactorAuthentication:ReactorFeatureStatus? = nil
    public var advancedRegistration:ReactorFeatureStatus? = nil
    public var applicationThemes:ReactorFeatureStatus? = nil
    public var breachedPasswordDetection:ReactorFeatureStatus? = nil
    public var connectors:ReactorFeatureStatus? = nil
    public var entityManagement:ReactorFeatureStatus? = nil
    public var licensed:Bool? = nil
    
    public init(advancedIdentityProviders: ReactorFeatureStatus? = nil, advancedMultiFactorAuthentication: ReactorFeatureStatus? = nil, advancedRegistration: ReactorFeatureStatus? = nil, applicationThemes: ReactorFeatureStatus? = nil, breachedPasswordDetection: ReactorFeatureStatus? = nil, connectors: ReactorFeatureStatus? = nil, entityManagement: ReactorFeatureStatus? = nil, licensed: Bool? = nil) {
        self.advancedIdentityProviders = advancedIdentityProviders
        self.advancedMultiFactorAuthentication = advancedMultiFactorAuthentication
        self.advancedRegistration = advancedRegistration
        self.applicationThemes = applicationThemes
        self.breachedPasswordDetection = breachedPasswordDetection
        self.connectors = connectors
        self.entityManagement = entityManagement
        self.licensed = licensed
    }

}
