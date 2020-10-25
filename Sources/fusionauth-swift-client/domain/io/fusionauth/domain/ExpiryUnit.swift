//
//  ExpiryUnit.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Expiry Unit Options.
 */

public enum ExpiryUnit:String, Codable{
    case MINUTES = "MINUTES"
    case HOURS = "HOURS"
    case DAYS = "DAYS"
    case WEEKS = "WEEKS"
    case MONTHS = "MONTHS"
    case YEARS = "YEARS"
}
