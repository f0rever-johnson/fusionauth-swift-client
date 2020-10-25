//
//  Email.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class Email:Codable{

    public var attachments:[Attachment]? = nil
    public var bcc:[EmailAddress]? = nil
    public var cc:[EmailAddress]? = nil
    public var from:EmailAddress? = nil
    public var html:String? = nil
    public var replyTo:EmailAddress? = nil
    public var subject:String? = nil
    public var text:String? = nil
    public var to:[EmailAddress]? = nil

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
