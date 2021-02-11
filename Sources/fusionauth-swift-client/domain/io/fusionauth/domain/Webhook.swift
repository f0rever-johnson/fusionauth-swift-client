//
//  Webhook.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation


/**
 * Creates a new Webhook Object
 * A server where events are sent. This includes user action events and any other events sent by FusionAuth.
 */

public struct Webhook:Codable {
    
    public var applicationIds:[UUID]? = nil
    public var connectTimeout:Int? = nil
    public var data:[String:JSONObject]? = nil
    public var description:String? = nil
    public var eventsEnabled:[EventType:Bool]? = nil
    public var global:Bool? = nil
    public var headers:HTTPHeaders? = nil
    public var httpAuthenticationPassword:String? = nil
    public var httpAuthenticationUsername:String? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var readTimeout:Int? = nil
    public var sslCertificate:String? = nil
    public var url:String? = nil
    
    public init(applicationIds: [UUID]? = nil, connectTimeout: Int? = nil, data: [String : JSONObject]? = nil, description: String? = nil, eventsEnabled: [EventType : Bool]? = nil, global: Bool? = nil, headers: HTTPHeaders? = nil, httpAuthenticationPassword: String? = nil, httpAuthenticationUsername: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, readTimeout: Int? = nil, sslCertificate: String? = nil, url: String? = nil) {
        self.applicationIds = applicationIds
        self.connectTimeout = connectTimeout
        self.data = data
        self.description = description
        self.eventsEnabled = eventsEnabled
        self.global = global
        self.headers = headers
        self.httpAuthenticationPassword = httpAuthenticationPassword
        self.httpAuthenticationUsername = httpAuthenticationUsername
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.readTimeout = readTimeout
        self.sslCertificate = sslCertificate
        self.url = url
    }

}
