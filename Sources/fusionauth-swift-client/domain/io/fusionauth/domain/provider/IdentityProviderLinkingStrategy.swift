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
    case createPendingLink = "CreatePendingLink"
    case disabled = "Disabled"
    case linkAnonymously = "LinkAnonymously"
    case linkByEmail = "LinkByEmail"
    case linkByEmailForExistingUser = "LinkByEmailForExistingUser"
    case linkByUsername = "LinkByUsername"
    case linkByUsernameForExistingUser = "LinkByUsernameForExistingUser"
    case unsupported = "Unsupported"
}
