//
//  Integrations.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Integrations Object.
 */

public struct Integrations:Codable {
    public var cleanSpeak:CleanSpeakConfiguration? = nil
    public var kafka:KafkaConfiguration? = nil

    public init(cleanSpeak: CleanSpeakConfiguration? = nil, kafka: KafkaConfiguration? = nil) {
        self.cleanSpeak = cleanSpeak
        self.kafka = kafka
    }

}
