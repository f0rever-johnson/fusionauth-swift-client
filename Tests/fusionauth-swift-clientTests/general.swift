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
        let jsonObject: [String:Any] =
            [
              "identityProviders": [
                [
                  "claimMap": [
                    "first_name": "firstName",
                    "last_name": "lastName",
                    "dept": "RegistrationData"
                  ],
                  "domains": [
                    "acme.com",
                    "acme.org"
                  ],
                  "headerKeyParameter" : "kid",
                  "id" : "a4e78daa-33a6-4844-b081-7779af1f09a4",
                  "insertInstant": 1595361142909,
                  "lastUpdateInstant": 1595361143101,
                  "name": "Acme Corp. ADFS",
                  "oauth2" : [
                    "authorization_endpoint" : "https://acme.com/adfs/oauth2/authorize?client_id=cf3b00da-9551-460a-ad18-33232e6cbff0&response_type=code&redirect_uri=https://acme.com/oauth2/redirect",
                    "token_endpoint" : "https://acme.com/adfs/oauth2/token"
                  ],
                  "type": "ExternalJWT",
                  "uniqueIdentityClaim": "email"
                ],
                [
                  "appId": "385572258114379",
                  "applicationConfiguration": [
                    "1c212e59-0d0e-6b1a-ad48-f4f92793be32": [
                      "createRegistration": true,
                      "enabled": true
                    ]
                  ],
                  "buttonText": "Login with Facebook",
                  "client_secret": "72417eb5aa454ef2373b361d721cb074",
                  "enabled": true,
                  "fields": "email",
                  "id" : "56abdcc7-8bd9-4321-9621-4e9bbebae494",
                  "insertInstant": 1595361142909,
                  "lastUpdateInstant": 1595361143101,
                  "name": "Facebook",
                  "permissions": "email,profile_image",
                  "type": "Facebook"
                ],
                [
                  "applicationConfiguration": [
                    "1c212e59-0d0e-6b1a-ad48-f4f92793be32": [
                      "createRegistration": true,
                      "enabled": true
                    ]
                  ],
                  "buttonText": "Login with Google",
                  "client_id": "254311943570-8e2i2hds0qdnee4124socceeh2q2mtjl.apps.googleusercontent.com",
                  "client_secret": "BRr7x7xz_-cXxIFznBDIdxF1",
                  "enabled": true,
                  "id": "82339786-3dff-42a6-aac6-1f1ceecb6c46",
                  "insertInstant": 1595361142909,
                  "lastUpdateInstant": 1595361143101,
                  "name": "Google",
                  "scope": "profile",
                  "type": "Google"
                ],
                [
                  "applicationConfiguration": [
                    "1c212e59-0d0e-6b1a-ad48-f4f92793be32": [
                      "createRegistration": true,
                      "enabled": true
                    ]
                  ],
                  "buttonText": "Login with Twitter",
                  "consumerKey": "24iuleLRKIZUNhxuuUK6yDZwb",
                  "consumerSecret": "e2ZpAaAfxv2j9eeh6JTeNcXMWdVLjRNriXm4wSZt1f1Ss3Syp4",
                  "enabled": true,
                  "id": "45bb233c-0901-4236-b5ca-ac46e2e0a5a5",
                  "insertInstant": 1595361142909,
                  "lastUpdateInstant": 1595361143101,
                  "name": "Twitter",
                  "type": "Twitter"
                ]
              ]
            ]
            

        let valid = JSONSerialization.isValidJSONObject(jsonObject)

        dump(valid)

        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions()) as Data
        
        //dump(jsonData.prettyPrinted)

        do{
            let json = try JSONDecoder().decode(IdentityProviderResponse.self, from: jsonData)
            
            let d = json.identityProviders
            
            for idp in d!{
                if idp.GetType() == .Twitter{
                    let twitter:TwitterIdentityProvider = idp.GetIdentity() as! TwitterIdentityProvider
                    
                    print(twitter.id!)
                }
            }
            
            
        //dump(json)
        }catch let JSONError as NSError {
        print("\(JSONError)")

        }


    }








}
extension Data {
    var prettyPrinted: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
