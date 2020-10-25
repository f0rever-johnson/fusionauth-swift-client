//
//  BaseLoginRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public protocol BaseLoginRequest:Codable{
    var applicationId:UUID? { get set }
    var ipAddress:String? { get set }
    var metaData:MetaData? { get set }
    var noJWT:Bool? { get set }
}
