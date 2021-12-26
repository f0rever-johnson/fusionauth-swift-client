//
//  Lambda.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Lambda:Codable{
    
    public var body:String?
    public var debug:Bool?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var type:LambdaType?


    public init(body: String? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, name: String? = nil, type: LambdaType? = nil) {
        self.body = body
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.name = name
        self.type = type
    }
}


