//
//  LambdaResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation



public struct LambdaResponse:Codable{
    public var lambda:Lambda? = nil
    public var lambdas:[Lambda]? = nil

    public init(lambda: Lambda? = nil, lambdas: [Lambda]? = nil) {
        self.lambda = lambda
        self.lambdas = lambdas
    }

}
