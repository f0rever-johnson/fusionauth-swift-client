//
//  FamilyResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct FamilyResponse:Codable{
    public var families:[Family]?
    public var family:Family?

    public init(families: [Family]? = nil, family: Family? = nil) {
        self.families = families
        self.family = family
    }

}
