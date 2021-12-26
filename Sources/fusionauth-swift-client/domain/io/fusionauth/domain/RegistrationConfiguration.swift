//
//  RegistrationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class RegistrationConfiguration:Enableable, Codable{
    public var enabled:Bool?
    public var birthDate:Requirable?
    public var confirmPassword:Bool?
    public var firstName:Requirable?
    public var formId:UUID?
    public var fullName:Requirable?
    public var lastName:Requirable?
    public var loginIdType:LoginIdType?
    public var middleName:Requirable?
    public var mobilePhone:Requirable?
    public var type:RegistrationType?
    
    public init(enabled: Bool? = nil, birthDate: Requirable? = nil, confirmPassword: Bool? = nil, firstName: Requirable? = nil, formId: UUID? = nil, fullName: Requirable? = nil, lastName: Requirable? = nil, loginIdType: LoginIdType? = nil, middleName: Requirable? = nil, mobilePhone: Requirable? = nil, type: RegistrationType? = nil) {
        self.enabled = enabled
        self.birthDate = birthDate
        self.confirmPassword = confirmPassword
        self.firstName = firstName
        self.formId = formId
        self.fullName = fullName
        self.lastName = lastName
        self.loginIdType = loginIdType
        self.middleName = middleName
        self.mobilePhone = mobilePhone
        self.type = type
    }
}

