//
//  BaseExportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public protocol BaseExportRequest{
    var dateTimeSecondsFormat:String? { get set }
    var zoneId:String? { get set }
}
