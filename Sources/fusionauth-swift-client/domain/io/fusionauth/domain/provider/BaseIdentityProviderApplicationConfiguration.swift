//
//  BaseIdentityProviderApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public protocol BaseIdentityProviderApplicationConfiguration:Enableable, Codable{
    var createRegistration:Bool? { get set }
    var data:[String:JSONObject]? { get set }
}
