//
//  FamilyEmailRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct FamilyEmailRequest:Codable{
    public var parentEmail:String? = nil

    public init(parentEmail: String? = nil) {
        self.parentEmail = parentEmail
    }

}
