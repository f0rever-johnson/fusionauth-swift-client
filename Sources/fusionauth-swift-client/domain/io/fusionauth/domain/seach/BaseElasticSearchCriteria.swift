//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public protocol BaseElasticSearchCriteria:BaseSearchCriteria {
 
    var accurateTotal:Bool? { get set }
    var ids:[UUID]? { get set }
    var query:String? { get set }
    var sortFields:[SortField]? { get set }
}
