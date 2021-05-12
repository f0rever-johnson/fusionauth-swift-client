//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/3/21.
//

import Foundation

public protocol BaseMessengerConfigurationProtocol:Codable{
   
    var data:[String:JSONObject]? { get set }
    var debug:Bool? { get set }
    var id:UUID? { get set }
    var insertInstant:Date? { get set }
    var lastUpdateInstant:Date? { get set }
    var name:String? { get set }
    var transport:String? { get set }
    var type:MessengerType? { get }

}
