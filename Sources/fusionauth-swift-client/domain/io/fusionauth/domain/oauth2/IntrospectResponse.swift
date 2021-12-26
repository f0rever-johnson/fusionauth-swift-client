//
//  IntrospectResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation


public class IntrospectResponse:Codable{
    var IntrospectResponse:Dictionary<String,JSONObject>?

    public init(IntrospectResponse: Dictionary<String,JSONObject>? = nil) {
        self.IntrospectResponse = IntrospectResponse
    }
}
