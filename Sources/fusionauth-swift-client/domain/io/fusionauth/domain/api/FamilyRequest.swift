//
//  FamilyRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

/**
 * API request for managing families and members.
 *
 */

public struct FamilyRequest:Codable{
    public var familyMember:FamilyMember?

    public init(familyMember: FamilyMember? = nil) {
        self.familyMember = familyMember
    }

}
