//
//  UsernameModeration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation


public class UsernameModeration:Codable, Enableable{
    public var enabled: Bool? = nil
    public var applicationId:UUID? = nil

    public init(enabled: Bool? = nil, applicationId: UUID? = nil) {
        self.enabled = enabled
        self.applicationId = applicationId
    }
}
