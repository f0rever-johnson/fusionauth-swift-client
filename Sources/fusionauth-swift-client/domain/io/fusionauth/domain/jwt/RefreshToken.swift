//
//  RefreshToken.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Refresh Token Object.
 */

public struct RefreshToken:Codable {
    public var applicationId:UUID? = nil
    public var data:JSONObject? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var metaData:MetaData? = nil
    public var startInstant:Date? = nil
    public var tenantId:UUID? = nil
    public var token:String? = nil
    public var userId:UUID? = nil
}
