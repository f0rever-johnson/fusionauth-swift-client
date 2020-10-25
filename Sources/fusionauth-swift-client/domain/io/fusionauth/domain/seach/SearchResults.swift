//
//  SearchResults.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Search Results Object.
 */

public struct SearchResults<T>{
    public var results:Array<T>? = nil
    public var total:UInt64? = nil

    public init(results: Array<T>? = nil, total: UInt64? = nil) {
        self.results = results
        self.total = total
    }

}
