//
//  BaseSearchCriteria.swift
// 
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Base Search Criteria Object.
 */

public protocol BaseSearchCriteria:Codable{
    var numberOfResults:Int? { get set }
    var orderBy:String? { get set }
    var startRow:Int? { get set }

}
