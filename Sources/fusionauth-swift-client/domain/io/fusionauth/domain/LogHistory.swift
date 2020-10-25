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

    /*
    public func LogHistory(actionerUserId:UUID, comment:String, createInstant:Int?, expiry:Int?){
        _ = Add(actionerUserId: actionerUserId, comment: comment, createInstant: createInstant, expiry: expiry)
    }

    public func Add(actionerUserId:UUID, comment:String, createInstant:Int?, expiry:Int?) -> LogHistory{
        historyItems.append(HistoryItem.init(actionerUserId: actionerUserId, comment: comment, createInstant: createInstant, expiry: expiry))
        return self
    }

    public func Earliest() -> HistoryItem?{
        if historyItems.count == 0{
            return nil
        }
        return historyItems[0]
    }

    public func Latest() -> HistoryItem?{
        if historyItems.count == 0{
            return nil
        }
        return historyItems[historyItems.count - 1]
    }
    */

    public struct HistoryItem:Codable {
        public var actionerUserId:UUID? = nil
        public var comment:String? = nil
        public var createInstant:Int? = nil
        public var expiry:Int? = nil

        public init(actionerUserId: UUID? = nil, comment: String? = nil, createInstant: Int? = nil, expiry: Int? = nil) {
            self.actionerUserId = actionerUserId
            self.comment = comment
            self.createInstant = createInstant
            self.expiry = expiry
        }

    }
}
