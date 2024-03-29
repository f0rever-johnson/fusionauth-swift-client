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
    
    case JWTPublicKeyUpdate = "jwt.public-key.update"
    case JWTRefreshTokenRevoke = "jwt.refresh-token.revoke"
    case JWTRefresh = "jwt.refresh"
    case AuditLogCreate = "audit-log.create"
    case EventLogCreate = "event-log.create"
    case KickStartSuccess = "kickstart.success"
    case GroupCreate = "group.create"
    case GroupCreateComplete = "group.create.complete"
    case GroupDelete = "group.delete"
    case GroupDeleteComplete = "group.delete.complete"
    case GroupMemberAdd = "group.member.add"
    case GroupMemberAddComplete = "group.member.add.complete"
    case GroupMemberRemove = "group.member.remove"
    case GroupMemberRemoveComplete = "group.member.remove.complete"
    case GroupMemberUpdate = "group.member.update"
    case GroupMemberUpdateComplete = "group.member.update.complete"
    case GroupUpdate = "group.update"
    case GroupUpdateComplete = "group.update.complete"
    case UserAction = "user.action"
    case UserBulkCreate = "user.bulk.create"
    case UserCreate = "user.create"
    case UserCreateComplete = "user.create.complete"
    case UserDeactivate = "user.deactivate"
    case UserDelete = "user.delete"
    case UserDeleteComplete = "user.delete.complete"
    case UserEmailUpdate = "user.email.update"
    case UserEmailVerified = "user.email.verified"
    case UserIdentityProviderLink = "user.identity-provider.link"
    case UserIdentityProviderUnLink = "user.identity-provider.unlink"
    case UserLoginIdDuplicateOnCreate = "user.loginId.duplicate.create"
    case UserLoginIdDuplicateOnUpdate = "user.loginId.duplicate.update"
    case UserLoginFailed = "user.login.failed"
    case UserLoginNewDevice = "user.login.new-device"
    case UserLoginSuccess = "user.login.success"
    case UserLoginSuspicious = "user.login.suspicious"
    case UserPasswordBreach = "user.password.breach"
    case UserPasswordResetSend = "user.password.reset.send"
    case UserPasswordResetStart = "user.password.reset.start"
    case UserPasswordResetSuccess = "user.password.reset.success"
    case UserPasswordUpdate = "user.password.update"
    case UserReactivate = "user.reactivate"
    case UserRegistrationCreate = "user.registration.create"
    case UserRegistrationCreateComplete = "user.registration.create.complete"
    case UserRegistrationDelete = "user.registration.delete"
    case UserRegistrationDeleteComplete = "user.registration.delete.complete"
    case UserRegistrationUpdate = "user.registration.update"
    case UserRegistrationUpdateComplete = "user.registration.update.complete"
    case UserRegistrationVerified = "user.registration.verified"
    case UserTwoFactorMethodAdd = "user.two-factor.method.add"
    case UserTwoFactorMethodRemove = "user.two-factor.method.remove"
    case UserUpdate = "user.update"
    case UserUpdateComplete = "user.update.complete"
    case Test = "test"
}
