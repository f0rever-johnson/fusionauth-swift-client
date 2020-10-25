//
//  FamilyRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * API request for managing families and members.
 *
 */

public struct FamilyRequest:Codable{
    public var familyMember:FamilyMember? = nil

    public init(familyMember: FamilyMember? = nil) {
        self.familyMember = familyMember
    }

}
