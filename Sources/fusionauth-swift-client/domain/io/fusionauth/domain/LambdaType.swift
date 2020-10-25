//
//  LambdaType.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * The types of lambdas that indicate how they are invoked by FusionAuth.
 *
 * @author Everaldlee Johnson
 */

public enum LambdaType:String, Codable{
    
    case JWTPopulate = "JWTPopulate"
    case OpenIDreconcile = "OpenIDreconcile"
    case SAMLV2Reconcile = "SAMLV2Reconcile"
    case SAMLV2Populate = "SAMLV2Populate"
}
