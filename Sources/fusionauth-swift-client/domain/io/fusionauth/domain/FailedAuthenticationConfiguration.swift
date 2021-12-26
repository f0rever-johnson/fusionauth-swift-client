//
//  FailedAuthenticationConfigurations.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Failed Authentication Configuration Object.
 */

public struct FailedAuthenticationConfiguration:Codable{
    public var actionDuration:UInt64?
    public var actionDurationUnit:ExpiryUnit?
    public var resetCountInSeconds:Int?
    public var tooManyAttempts:Int?
    public var userActionId:UUID?

    public init(actionDuration: UInt64? = nil, actionDurationUnit: ExpiryUnit? = nil, resetCountInSeconds: Int? = nil, tooManyAttempts: Int? = nil, userActionId: UUID? = nil) {
        self.actionDuration = actionDuration
        self.actionDurationUnit = actionDurationUnit
        self.resetCountInSeconds = resetCountInSeconds
        self.tooManyAttempts = tooManyAttempts
        self.userActionId = userActionId
    }

}
