//
//  UserActionPhase.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public enum UserActionPhase:String, Codable {
    case start = "start"
    case modify = "modify"
    case cancel = "cancel"
    case end = "end"
}
