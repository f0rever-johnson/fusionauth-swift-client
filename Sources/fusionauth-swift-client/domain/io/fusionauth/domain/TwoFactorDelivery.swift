//
//  TwoFactorDelivery.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * @deprecated Use <code>User.twoFactor.methods</code>
 */

public enum TwoFactorDelivery:String, Codable {
    case None = "None"
    case TextMessage = "TextMessage"

}
