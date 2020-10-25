//  ClientResponse.swift
//  Created by Everaldlee Johnson on 10/25/20.

import Foundation


public struct ClientResponse<T:Codable>{
    public var statusCode:Int?
    public var successResponse:T?
    public var errorResponse:Errors?
    public var exception:NSError?
    public var WasSuccessful:Bool{
        get{
            guard let status = statusCode else{
                return false
            }
            return (200 ... 299).contains(status) && exception == nil
        }
    }

    public init(){
        
    }
}
