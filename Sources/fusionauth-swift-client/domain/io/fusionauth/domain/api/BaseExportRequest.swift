//
//  BaseExportRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public protocol BaseExportRequest{
    var dateTimeSecondsFormat:String? { get set }
    var zoneId:String? { get set }
}
