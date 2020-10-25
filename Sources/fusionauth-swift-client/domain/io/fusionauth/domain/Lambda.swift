//
//  Lambda.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * A JavaScript lambda function that is executed during certain events inside FusionAuth.
 *
 */

public class Lambda:Codable{
    
    public var body:String? = nil
    public var debug:Bool? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var name:String? = nil
    public var type:LambdaType? = nil


    public init(body: String? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, name: String? = nil, type: LambdaType? = nil) {
        self.body = body
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.name = name
        self.type = type
    }
}


