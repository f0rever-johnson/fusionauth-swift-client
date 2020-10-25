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
    public var defaultTopic:String? = nil
    public var enabled:Bool? = nil
    public var producer:[String:String]? = nil

    public init(defaultTopic: String? = nil, enabled: Bool? = nil, producer: [String:String]? = nil) {
        self.defaultTopic = defaultTopic
        self.enabled = enabled
        self.producer = producer
    }

}
