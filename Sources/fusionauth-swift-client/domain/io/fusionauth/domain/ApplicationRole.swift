//
//  ApplicationRole.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Application Role Object.
 */

public class ApplicationRole:Codable{
    public var description:String? = nil
    public var id:UUID? = nil
    public var name:String? = nil
    public var isDefault:Bool? = nil
    public var isSuperRole:Bool? = nil

    public init(description: String? = nil, id: UUID? = nil, name: String? = nil, isDefault: Bool? = nil, isSuperRole: Bool? = nil) {
        self.description = description
        self.id = id
        self.name = name
        self.isDefault = isDefault
        self.isSuperRole = isSuperRole
    }

}
