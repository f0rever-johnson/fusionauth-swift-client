//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MessengerRequest:Codable{
    public var messenger:BaseMessengerConfiguration?
    
    public init(messenger:BaseMessengerConfiguration? = nil){
        self.messenger = messenger
    }
}
