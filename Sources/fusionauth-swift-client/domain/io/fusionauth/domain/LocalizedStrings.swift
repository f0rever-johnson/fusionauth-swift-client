//
//  LocalizedStrings.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
* Models a set of localized Strings that can be stored as JSON.
*
* @author Everaldlee Johnson
*/


public class LocalizedStrings:Codable{
    
    var localizedString:Dictionary<String,String>? = nil

    public init(localizedString: Dictionary<String,String>? = nil) {
        self.localizedString = localizedString
    }

}
