//
//  LogHistory.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Creates a new Log History Object.
 */

public class LogHistory:Codable{
    public var historyItems:[HistoryItem]? = nil

    public init(historyItems: [HistoryItem]? = nil) {
        self.historyItems = historyItems
    }
}
