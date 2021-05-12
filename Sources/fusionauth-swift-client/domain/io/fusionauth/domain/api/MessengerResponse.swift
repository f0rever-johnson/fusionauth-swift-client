//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MessengerResponse:Codable{
    public var messenger:BaseMessengerConfiguration? = nil
    public var messengers:[BaseMessengerConfiguration]? = nil
    
    public init(messenger:BaseMessengerConfiguration? = nil, messengers:[BaseMessengerConfiguration]? = nil){
        self.messenger = messenger
        self.messengers = messengers
    }
}
