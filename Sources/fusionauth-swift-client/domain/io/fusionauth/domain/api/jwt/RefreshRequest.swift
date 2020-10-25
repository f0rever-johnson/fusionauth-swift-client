//
//  RefreshRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

public struct RefreshRequest:Codable{
    public var refreshToken:String? = nil

    public init(refreshToken: String? = nil) {
        self.refreshToken = refreshToken
    }

}
