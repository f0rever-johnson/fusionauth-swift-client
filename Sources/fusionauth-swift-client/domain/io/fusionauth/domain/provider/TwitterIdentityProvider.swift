//
//  TwitterIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

/**
 * Creates a new Twitter Identity Provider Object.
 */

public class TwitterIdentityProvider:BaseIdentityProvider{
    public typealias D = TwitterApplicationConfiguration
    public var applicationConfiguration: [String : TwitterApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var consumerKey:String? = nil
    public var consumerSecret:String? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil



}
