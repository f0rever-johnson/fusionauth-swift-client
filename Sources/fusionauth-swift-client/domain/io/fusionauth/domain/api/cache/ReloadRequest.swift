//
//  ReloadRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//2

import Foundation


public class ReloadRequest:Codable{
    public var names:[String]? = nil

    public init(names: [String]? = nil) {
        self.names = names
    }

}
