//
//  general.swift
//  FusionAuthSwiftClientTests
//
//  Created by Everaldlee Johnson on 2/25/20.
//  Copyright © 2020 F0rever_Johnson. All rights reserved.
//

import XCTest
import fusionauth_swift_client

class general: XCTestCase {

    func testcheckJSON(){
        let jsonObject: [String: Any] = [
            "application": [
                "active": true,
                "authenticationTokenConfiguration": [
                    "enabled": false
                ],
                "emailConfiguration": [],
                "formConfiguration": [
                    "adminRegistrationFormId": "94ba7116-37f8-11eb-8dae-3ec13190203c"
                ],
                "id": "d5b8a58a-4ceb-4a69-b9d9-0dd706774c14",
                "insertInstant": 1613429515390,
                "jwtConfiguration": [
                    "enabled": false,
                    "refreshTokenExpirationPolicy": "Fixed",
                    "refreshTokenTimeToLiveInMinutes": 0,
                    "refreshTokenUsagePolicy": "Reusable",
                    "timeToLiveInSeconds": 0
                ],
                "lambdaConfiguration": [],
                "lastUpdateInstant": 1613429515390,
                "loginConfiguration": [
                    "allowTokenRefresh": false,
                    "generateRefreshTokens": false,
                    "requireAuthentication": true
                ],
                "name": "Swift Client Test",
                "oauthConfiguration": [
                    "clientId": "d5b8a58a-4ceb-4a69-b9d9-0dd706774c14",
                    "clientSecret": "w7RZHFoPsrtOGkF87SJusQwKGtkBVQXPav5lpKzYtcE",
                    "generateRefreshTokens": false,
                    "logoutBehavior": "AllApplications",
                    "requireClientAuthentication": true
                ],
                "passwordlessConfiguration": [
                    "enabled": false
                ],
                "registrationConfiguration": [
                    "birthDate": [
                        "enabled": false,
                        "required": false
                    ],
                    "confirmPassword": false,
                    "enabled": false,
                    "firstName": [
                        "enabled": false,
                        "required": false
                    ],
                    "fullName": [
                        "enabled": false,
                        "required": false
                    ],
                    "lastName": [
                        "enabled": false,
                        "required": false
                    ],
                    "loginIdType": "email",
                    "middleName": [
                        "enabled": false,
                        "required": false
                    ],
                    "mobilePhone": [
                        "enabled": false,
                        "required": false
                    ],
                    "type": "basic"
                ],
                "registrationDeletePolicy": [
                    "unverified": [
                        "enabled": false,
                        "numberOfDaysToRetain": 0
                    ]
                ],
                "samlv2Configuration": [
                    "debug": false,
                    "enabled": false,
                    "requireSignedRequests": false,
                    "xmlSignatureC14nMethod": "exclusive_with_comments",
                    "xmlSignatureLocation": "Assertion"
                ],
                "state": "Active",
                "tenantId": "94be35b0-37f8-11eb-8dae-3ec13190203c",
                "verifyRegistration": false
            ]
        ]


        let valid = JSONSerialization.isValidJSONObject(jsonObject)

        dump(valid)

        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions()) as Data

        do{
        let json = try JSONDecoder().decode(ApplicationResponse.self, from: jsonData)
        dump(json)
        }catch let JSONError as NSError {
        print("\(JSONError)")

        }


    }








}
