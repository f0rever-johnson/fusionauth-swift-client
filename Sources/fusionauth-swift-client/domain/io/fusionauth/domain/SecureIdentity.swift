//
//  SecureIdentity.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public protocol SecureIdentity:Codable{
    var breachedPasswordLastCheckedInstant:Date? { get set }
    var breachedPasswordStatus:BreachedPasswordStatus? { get set }
    var connectorId:UUID? { get set }
    var encryptionScheme:String? { get set }
    var factor:Int? { get set }
    var id:UUID? { get set }
    var lastLoginInstant:Date? { get set }
    var password:String? { get set }
    var passwordChangeReason:ChangePasswordReason? { get set }
    var passwordChangedRequired:Bool? { get set }
    var passwordLastUpdateInstant:Date? { get set }
    var salt:String? { get set }
    var twoFactorDelivery:TwoFactorDelivery? { get set }
    var twoFactorEnabled:Bool? { get set }
    var twoFactorSecret:String? { get set }
    var username:String? { get set }
    var usernameStatus:ContentStatus? { get set }
    var verified:Bool? { get set }
}
