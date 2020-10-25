//
//  EmailPlus.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class EmailPlus:Codable, Enableable{
   
    public var emailTemplateId:UUID? = nil
    public var maximumTimeToSendEmailInHours:Int? = nil
    public var minimumTimeToSendEmailInHours:Int? = nil
    public var enabled: Bool? = nil

    public init(emailTemplateId: UUID? = nil, maximumTimeToSendEmailInHours: Int? = nil, minimumTimeToSendEmailInHours: Int? = nil, enabled: Bool? = nil) {
        self.emailTemplateId = emailTemplateId
        self.maximumTimeToSendEmailInHours = maximumTimeToSendEmailInHours
        self.minimumTimeToSendEmailInHours = minimumTimeToSendEmailInHours
        self.enabled = enabled
    }

}





