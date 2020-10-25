//
//  EventType.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Models the event types that FusionAuth produces.
 *
 */

public enum EventType:String, Codable{
    case UserDelete = "user.delete"
    case UserCreate = "user.create"
    case UserUpdate = "user.update"
    case UserDeactivate = "user.deactivate"
    case UserBulkCreate = "user.bulk.create"
    case UserReactivate = "user.reactivate"
    case UserAction = "user.action"
    case JWTRefreshTokenRevoke = "jwt.refresh-token.revoke"
    case JWTPublicKeyUpdate = "jwt.public-key.update"
    case UserLoginSuccess = "user.login.success"
    case UserLoginFailed = "user.login.failed"
    case UserRegistrationCreate = "user.registration.create"
    case UserRegistrationUpdate = "user.registration.update"
    case UserRegistrationDelete = "user.registration.delete"
    case UserRegistrationVerified = "user.registration.verified"
    case UserEmailVerified = "user.email.verified"
    case Test = "test"
}
