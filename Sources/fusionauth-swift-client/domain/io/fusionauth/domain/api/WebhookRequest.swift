//
//  WebhookRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct WebhookRequest:Codable {
    public var webhook:Webhook? = nil

    public init(webhook: Webhook? = nil) {
        self.webhook = webhook
    }
}
