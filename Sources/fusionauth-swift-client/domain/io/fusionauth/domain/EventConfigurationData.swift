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
    public var enabled: Bool? = nil
    public var transactionType:TransactionType? = nil

    public init(enabled: Bool? = nil, transactionType: TransactionType? = nil) {
        self.enabled = enabled
        self.transactionType = transactionType
    }

}
