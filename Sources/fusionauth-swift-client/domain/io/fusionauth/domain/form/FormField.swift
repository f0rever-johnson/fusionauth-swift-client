//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class FormField:Codable{
    public var confirm:Bool? = nil
    public var consentId:UUID? = nil
    public var control:FormControl? = nil
    public var data:[String:JSONObject]? = nil
    public var description:String? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var name:String? = nil
    public var options:[String]? = nil
    public var required:Bool? = nil
    public var type:FormDataType? = nil
    public var validator:FormFieldValidator? = nil
    
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
