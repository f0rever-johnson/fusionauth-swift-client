//
//  FamilyResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct FamilyResponse:Codable{
    public var families:[Family]? = nil
    public var family:Family? = nil

    public init(families: [Family]? = nil, family: Family? = nil) {
        self.families = families
        self.family = family
    }

}
