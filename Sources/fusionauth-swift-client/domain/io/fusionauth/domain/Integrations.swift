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
    public var kafkaConfiguration:KafkaConfiguration? = nil
    public var twilio:TwilioConfiguration? = nil

    public init(cleanSpeak: CleanSpeakConfiguration? = nil, kafkaConfiguration: KafkaConfiguration? = nil, twilio: TwilioConfiguration? = nil) {
        self.cleanSpeak = cleanSpeak
        self.kafkaConfiguration = kafkaConfiguration
        self.twilio = twilio
    }

}
