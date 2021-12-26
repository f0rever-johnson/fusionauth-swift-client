//
//  LambdaRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct LambdaRequest:Codable{
    public var lambda:Lambda?

    public init(lambda: Lambda? = nil) {
        self.lambda = lambda
    }

}
