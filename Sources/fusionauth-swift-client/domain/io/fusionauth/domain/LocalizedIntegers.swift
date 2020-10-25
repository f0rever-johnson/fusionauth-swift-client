//
//  LocalizedIntegers.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Models a set of localized Integers that can be stored as JSON.
 *
 * @author Everaldlee Johnson
 */

public class LocalizedIntegers:Codable{
    
    var localizedIntegers:Dictionary<String,Int>? = nil


    public init(localizedIntegers: Dictionary<String,Int>? = nil) {
        self.localizedIntegers = localizedIntegers
    }
}
