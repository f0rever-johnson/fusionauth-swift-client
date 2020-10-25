//
//  RawLogin.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Raw Login Object.
 */

public class RawLogin:Codable {
    public var applicationId:UUID? = nil
    public var instant:Date? = nil
    public var ipAddress:String? = nil
    public var userId:UUID? = nil

    public init(applicationId: UUID? = nil, instant: Date? = nil, ipAddress: String? = nil, userId: UUID? = nil) {
        self.applicationId = applicationId
        self.instant = instant
        self.ipAddress = ipAddress
        self.userId = userId
    }

}
