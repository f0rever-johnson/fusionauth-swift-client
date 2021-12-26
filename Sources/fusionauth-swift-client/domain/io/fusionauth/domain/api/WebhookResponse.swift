//
//  WebhookResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct WebhookResponse:Codable {
    public var webhook:Webhook?
    public var webhooks:[Webhook]?

    public init(webhook: Webhook? = nil, webhooks: [Webhook]? = nil) {
        self.webhook = webhook
        self.webhooks = webhooks
    }
}
