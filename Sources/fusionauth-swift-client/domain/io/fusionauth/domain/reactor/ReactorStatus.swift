//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class ReactorStatus:Codable{

    public var advancedIdentityProviders:ReactorFeatureStatus? = nil
    public var advancedRegistrationForms:ReactorFeatureStatus? = nil
    public var breachedPasswordDetection:ReactorFeatureStatus? = nil
    public var breachedPasswordMetrics:[String:BreachedPasswordTenantMetric]? = nil
    public var connectors:ReactorFeatureStatus? = nil
    public var entityManagement:ReactorFeatureStatus? = nil
    public var licensed:Bool? = nil
    public var multiFactorAuthentication:ReactorFeatureStatus? = nil
    
    public init(advancedIdentityProviders: ReactorFeatureStatus? = nil, advancedRegistrationForms: ReactorFeatureStatus? = nil, breachedPasswordDetection: ReactorFeatureStatus? = nil, breachedPasswordMetrics: [String : BreachedPasswordTenantMetric]? = nil, connectors: ReactorFeatureStatus? = nil, entityManagement: ReactorFeatureStatus? = nil, licensed: Bool? = nil, multiFactorAuthentication: ReactorFeatureStatus? = nil) {
        self.advancedIdentityProviders = advancedIdentityProviders
        self.advancedRegistrationForms = advancedRegistrationForms
        self.breachedPasswordDetection = breachedPasswordDetection
        self.breachedPasswordMetrics = breachedPasswordMetrics
        self.connectors = connectors
        self.entityManagement = entityManagement
        self.licensed = licensed
        self.multiFactorAuthentication = multiFactorAuthentication
    }
    
    
}
