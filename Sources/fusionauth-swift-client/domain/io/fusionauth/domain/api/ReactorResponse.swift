//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class ReactorResponse:Codable{
    
    public var status:ReactorStatus?
    
    public init(status: ReactorStatus? = nil) {
        self.status = status
    }
}
