//
//  KafkaConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Kafka Configuration Object.
 */

public struct KafkaConfiguration:Enableable, Codable {
    public var defaultTopic:String?
    public var enabled:Bool?
    public var producer:[String:String]?

    public init(defaultTopic: String? = nil, enabled: Bool? = nil, producer: [String:String]? = nil) {
        self.defaultTopic = defaultTopic
        self.enabled = enabled
        self.producer = producer
    }

}
