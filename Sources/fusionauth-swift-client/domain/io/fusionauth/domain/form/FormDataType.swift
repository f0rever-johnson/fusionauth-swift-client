//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public enum FormDataType:String, Codable{
    case Bool = "bool"
    case Consent = "consent"
    case Date = "date"
    case Email = "email"
    case Number = "number"
    case String = "string"
}
