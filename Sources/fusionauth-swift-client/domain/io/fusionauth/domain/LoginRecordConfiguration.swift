//
//  LoginRecordConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class LoginRecordConfiguration:Codable{
    public var delete:DeleteConfiguration?

    public init(delete: DeleteConfiguration? = nil) {
        self.delete = delete
    }
}
