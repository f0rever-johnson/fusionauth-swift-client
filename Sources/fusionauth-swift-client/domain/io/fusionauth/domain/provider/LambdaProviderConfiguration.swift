//
//  LambdaProviderConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class LambdaProviderConfiguration:Codable{
    public var reconciled:UUID? = nil

    public init(reconciled: UUID? = nil) {
        self.reconciled = reconciled
    }

}
