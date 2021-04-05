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
        let jsonObject: [String: Any] =
             [
              "roles" : [],
              "exp" : 1614026428,
              "jti" : "9913b021-6b3a-4034-a1d9-0eb6a49f4686",
              "iss" : "acme.com",
              "email_verified" : true,
              "sub" : "d48f0bc3-04a8-4536-8c4b-a57838691499",
              "authenticationType" : "PASSWORD",
              "aud" : "d5b8a58a-4ceb-4a69-b9d9-0dd706774c14",
              "iat" : 1614022828,
              "applicationId" : "d5b8a58a-4ceb-4a69-b9d9-0dd706774c14",
              "email" : "swiftclient@fusionauth.io",
              "preferred_username" : "swiftClient"
            ]


        let valid = JSONSerialization.isValidJSONObject(jsonObject)

        dump(valid)

        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions()) as Data

        do{
            let json = try JSONDecoder().decode(JWT.self, from: jsonData)
        dump(json)
        }catch let JSONError as NSError {
        print("\(JSONError)")

        }


    }








}
