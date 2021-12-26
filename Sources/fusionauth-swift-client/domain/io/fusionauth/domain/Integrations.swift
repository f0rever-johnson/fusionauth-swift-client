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
    public var cleanspeak:CleanSpeakConfiguration?
    public var kafka:KafkaConfiguration?

    public init(cleanSpeak: CleanSpeakConfiguration? = nil, kafka: KafkaConfiguration? = nil) {
        self.cleanspeak = cleanSpeak
        self.kafka = kafka
    }

}
