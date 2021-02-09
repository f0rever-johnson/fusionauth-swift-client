//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum HTTPMethod:String, Codable{
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case HEAD = "HEAD"
    case OPTIONS = "OPTIONS"
    case PATCH = "PATCH"
}
