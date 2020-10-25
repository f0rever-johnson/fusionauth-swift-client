//
//  WebhookResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct WebhookResponse:Codable {
    public var webhook:Webhook? = nil
    public var webhooks:[Webhook]? = nil

    public init(webhook: Webhook? = nil, webhooks: [Webhook]? = nil) {
        self.webhook = webhook
        self.webhooks = webhooks
    }
}
