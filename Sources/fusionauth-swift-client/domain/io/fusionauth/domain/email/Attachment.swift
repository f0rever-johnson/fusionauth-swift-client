//
//  Attachment.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Attachment:Codable{
    public var attachment:[UInt8]? = nil
    public var mime:String? = nil
    public var name:String? = nil

    public init(attachment: [UInt8]? = nil, mime: String? = nil, name: String? = nil) {
        self.attachment = attachment
        self.mime = mime
        self.name = name
    }

}
