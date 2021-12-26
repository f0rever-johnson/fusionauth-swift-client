//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormField:Codable{
    public var confirm:Bool?
    public var consentId:UUID?
    public var control:FormControl?
    public var data:[String:JSONObject]?
    public var description:String?
    public var id:UUID?
    public var insertInstant:Date?
    public var name:String?
    public var options:[String]?
    public var required:Bool?
    public var type:FormDataType?
    public var validator:FormFieldValidator?
    
    public init(confirm: Bool? = nil, consentId: UUID? = nil, control: FormControl? = nil, data: [String : JSONObject]? = nil, description: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, name: String? = nil, options: [String]? = nil, required: Bool? = nil, type: FormDataType? = nil, validator: FormFieldValidator? = nil) {
        self.confirm = confirm
        self.consentId = consentId
        self.control = control
        self.data = data
        self.description = description
        self.id = id
        self.insertInstant = insertInstant
        self.name = name
        self.options = options
        self.required = required
        self.type = type
        self.validator = validator
    }
    
}
