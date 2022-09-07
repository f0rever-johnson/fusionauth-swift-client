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

    public var connectTimeout:Int?
    public var data:[String:JSONObject]?
    public var description:String?
    public var eventsEnabled:[EventType:Bool]?
    public var global:Bool?
    public var headers:HTTPHeaders?
    public var httpAuthenticationPassword:String?
    public var httpAuthenticationUsername:String?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var readTimeout:Int?
    public var sslCertificate:String?
    public var tenantIds:[UUID]?
    public var url:String?
    
    public init(connectTimeout: Int? = nil, data: [String : JSONObject]? = nil, description: String? = nil, eventsEnabled: [EventType : Bool]? = nil, global: Bool? = nil, headers: HTTPHeaders? = nil, httpAuthenticationPassword: String? = nil, httpAuthenticationUsername: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, readTimeout: Int? = nil, sslCertificate: String? = nil, tenantIds: [UUID]? = nil, url: String? = nil) {
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
        self.tenantIds = tenantIds
        self.url = url
    }

}
