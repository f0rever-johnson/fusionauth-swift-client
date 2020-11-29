//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class ApplicationFormConfiguration:Codable{
    public var adminRegistrationFormId:UUID?
    
    public init(adminRegistrationFormId: UUID? = nil) {
        self.adminRegistrationFormId = adminRegistrationFormId
    }
    
    
}
