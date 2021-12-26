//
//  Attachment.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Attachment:Codable{
    public var attachment:[UInt8]?
    public var mime:String?
    public var name:String?

    public init(attachment: [UInt8]? = nil, mime: String? = nil, name: String? = nil) {
        self.attachment = attachment
        self.mime = mime
        self.name = name
    }

}
