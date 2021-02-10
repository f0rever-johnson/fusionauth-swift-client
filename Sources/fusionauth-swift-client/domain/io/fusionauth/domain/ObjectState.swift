//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/10/21.
//

import Foundation

public enum ObjectState:String, Codable{
    case Active = "Active"
    case Inactive = "Inactive"
    case PendingDelete = "PendingDelete"
}
