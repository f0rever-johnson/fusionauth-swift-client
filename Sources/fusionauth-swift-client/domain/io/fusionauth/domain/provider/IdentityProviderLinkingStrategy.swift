//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

/**
 * The IdP behavior when no user link has been made yet.
 *
 * @author Daniel DeGroff
 */

public enum IdentityProviderLinkingStrategy:String, Codable{
    case CreatePendingLink = "CreatePendingLink"
    case LinkAnonymously = "LinkAnonymously"
    case LinkByEmail = "LinkByEmail"
    case LinkByEmailForExistingUser = "LinkByEmailForExistingUser"
    case LinkByUsername = "LinkByUsername"
    case LinkByUsernameForExistingUser = "LinkByUsernameForExistingUser"
    case Unsupported = "Unsupported"
}
