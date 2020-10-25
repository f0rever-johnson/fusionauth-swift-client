//
//  WebhookRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct WebhookRequest:Codable {
    public var webhook:Webhook? = nil

    public init(webhook: Webhook? = nil) {
        self.webhook = webhook
    }
}
