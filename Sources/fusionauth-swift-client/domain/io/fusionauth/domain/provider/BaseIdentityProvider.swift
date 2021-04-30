//
//  BaseIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

// Protocols do not allow generic parameters; use associated types instead

public protocol BaseIdentityProvider:Enableable, IdentityProvider{
    
    associatedtype D
    
    var applicationConfiguration:[String:D]? { get set }
    var data:[String:JSONObject]? {get set}
    var debug:Bool? { get set }
    var id:UUID? { get set }
    var insertinstant:Date? { get set}
    var lambdaConfiguration:LambdaConfiguration? { set get }
    var lastUpdateInstant:Date? { get set }
    var name:String? { get set }
    var type:IdentityProviderType? { get }
    
    
    
}
