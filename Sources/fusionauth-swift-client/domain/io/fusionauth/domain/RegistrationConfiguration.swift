//
//  RegistrationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class RegistrationConfiguration:Enableable, Codable{
    public var enabled:Bool?
    public var birthDate:Requirable? = nil
    public var confirmPassword:Bool? = nil
    public var firstName:Requirable? = nil
    public var formId:UUID? = nil
    public var fullName:Requirable? = nil
    public var lastName:Requirable? = nil
    public var loginIdType:LoginIdType? = nil
    public var middleName:Requirable? = nil
    public var mobilePhone:Requirable? = nil
    public var type:RegistrationType? = nil
    
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

