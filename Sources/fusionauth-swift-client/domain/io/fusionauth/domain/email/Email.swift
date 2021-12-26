//
//  Email.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Email:Codable{

    public var attachments:[Attachment]?
    public var bcc:[EmailAddress]?
    public var cc:[EmailAddress]?
    public var from:EmailAddress?
    public var html:String?
    public var replyTo:EmailAddress?
    public var subject:String?
    public var text:String?
    public var to:[EmailAddress]?

    public init(attachments: [Attachment]? = nil, bcc: [EmailAddress]? = nil, cc: [EmailAddress]? = nil, from: EmailAddress? = nil, html: String? = nil, replyTo: EmailAddress? = nil, subject: String? = nil, text: String? = nil, to: [EmailAddress]? = nil) {
        self.attachments = attachments
        self.bcc = bcc
        self.cc = cc
        self.from = from
        self.html = html
        self.replyTo = replyTo
        self.subject = subject
        self.text = text
        self.to = to
    }
}
