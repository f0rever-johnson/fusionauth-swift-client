//
//  FamilyConfiguratio.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class FamilyConfiguration:Codable, Enableable{
    
    public var allowChildRegistrations:Bool?
    public var confirmChildEmailTemplateId:UUID?
    public var deleteOrphanedAccounts:Bool?
    public var deleteOrphanedAccountsDays:Int?
    public var familyRequestEmailTemplateId:UUID?
    public var maximumChildAge:Int?
    public var minimumOwnerAge:Int?
    public var parentEmailRequired:Bool?
    public var parentRegistrationEmailTemplateId:UUID?
    public var enabled: Bool?

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
