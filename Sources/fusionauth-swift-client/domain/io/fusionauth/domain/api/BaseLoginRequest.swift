//
//  BaseLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public protocol BaseLoginRequest:Codable{
    var applicationId:UUID? { get set }
    var ipAddress:String? { get set }
    var metaData:MetaData? { get set }
    var noJWT:Bool? { get set }
}
