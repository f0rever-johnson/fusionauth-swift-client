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
            "generalErrors": [
                [
                    "code": "[TenantIdRequired]",
                    "message": "A Tenant Id is required to complete this request. To complete this request, you may assign a Tenant to your API key, or add the X-FusionAuth-TenantId HTTP request header with the Tenant Id."
                ]
            ]
        ]


        let valid = JSONSerialization.isValidJSONObject(jsonObject)

        dump(valid)

        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions()) as Data

        do{
        let error = try JSONDecoder().decode(Errors.self, from: jsonData)
        dump(error)
        }catch let JSONError as NSError {
        print("\(JSONError)")

        }


    }








}
