//
//  LambdaRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct LambdaRequest:Codable{
    public var lambda:Lambda? = nil

    public init(lambda: Lambda? = nil) {
        self.lambda = lambda
    }

}
