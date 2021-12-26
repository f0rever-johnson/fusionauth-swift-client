//
//  EventConfigurationData.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
* Creates a new Event Configuration Data Object.
*/

public class EventConfigurationData:Codable, Enableable{
    public var enabled: Bool?
    public var transactionType:TransactionType?

    public init(enabled: Bool? = nil, transactionType: TransactionType? = nil) {
        self.enabled = enabled
        self.transactionType = transactionType
    }

}
