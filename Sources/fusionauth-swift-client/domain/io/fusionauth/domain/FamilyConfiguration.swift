//
//  FamilyConfiguratio.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class FamilyConfiguration:Codable, Enableable{
    
    public var allowChildRegistrations:Bool? = nil
    public var confirmChildEmailTemplateId:UUID? = nil
    public var deleteOrphanedAccounts:Bool? = nil
    public var deleteOrphanedAccountsDays:Int? = nil
    public var familyRequestEmailTemplateId:UUID? = nil
    public var maximumChildAge:Int? = nil
    public var minimumOwnerAge:Int? = nil
    public var parentEmailRequired:Bool? = nil
    public var parentRegistrationEmailTemplateId:UUID? = nil
    public var enabled: Bool? = nil

    public init(allowChildRegistrations: Bool? = nil, confirmChildEmailTemplateId: UUID? = nil, deleteOrphanedAccounts: Bool? = nil, deleteOrphanedAccountsDays: Int? = nil, familyRequestEmailTemplateId: UUID? = nil, maximumChildAge: Int? = nil, minimumOwnerAge: Int? = nil, parentEmailRequired: Bool? = nil, parentRegistrationEmailTemplateId: UUID? = nil, enabled: Bool? = nil) {
        self.allowChildRegistrations = allowChildRegistrations
        self.confirmChildEmailTemplateId = confirmChildEmailTemplateId
        self.deleteOrphanedAccounts = deleteOrphanedAccounts
        self.deleteOrphanedAccountsDays = deleteOrphanedAccountsDays
        self.familyRequestEmailTemplateId = familyRequestEmailTemplateId
        self.maximumChildAge = maximumChildAge
        self.minimumOwnerAge = minimumOwnerAge
        self.parentEmailRequired = parentEmailRequired
        self.parentRegistrationEmailTemplateId = parentRegistrationEmailTemplateId
        self.enabled = enabled
    }

}
