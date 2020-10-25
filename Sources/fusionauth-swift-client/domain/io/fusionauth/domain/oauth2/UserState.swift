//
//  UserState.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum UserState:String, Codable{
    case authenticated = "Authenticated"
    case authenticatedNotRegistered = "AuthenticatedNotRegistered"
}
