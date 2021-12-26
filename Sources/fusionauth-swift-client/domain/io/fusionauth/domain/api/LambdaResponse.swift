//
//  LambdaResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation



public struct LambdaResponse:Codable{
    public var lambda:Lambda?
    public var lambdas:[Lambda]?

    public init(lambda: Lambda? = nil, lambdas: [Lambda]? = nil) {
        self.lambda = lambda
        self.lambdas = lambdas
    }

}
