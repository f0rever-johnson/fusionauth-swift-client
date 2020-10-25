//
//  TransactionType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Transaction Type Options.
 */

public enum TransactionType:String, Codable{
    case None = "None"
    case `Any` = "Any"
    case SimpleMajority = "SimpleMajority"
    case SuperMajority = "SuperMajority"
    case AbsoluteMajority = "AbsoluteMajority"

}
