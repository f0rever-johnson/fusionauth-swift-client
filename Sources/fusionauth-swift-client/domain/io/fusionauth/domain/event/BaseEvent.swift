//
//  BaseEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public protocol BaseEvent: Codable{
    var id:UUID? {get set}
    var info:EventInfo? {get set}
    var tenantId:UUID? {get set}
    var type:EventType? {get set}
}
