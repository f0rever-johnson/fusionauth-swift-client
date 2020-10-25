//
//  BaseEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public protocol BaseEvent{
    var createInstant:Date? {get}
    var id:UUID? {get}
    var tenantId:UUID? {get}
}
