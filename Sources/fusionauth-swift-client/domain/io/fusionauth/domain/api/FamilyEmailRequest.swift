//
//  FamilyEmailRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct FamilyEmailRequest:Codable{
    public var parentEmail:String?

    public init(parentEmail: String? = nil) {
        self.parentEmail = parentEmail
    }

}
