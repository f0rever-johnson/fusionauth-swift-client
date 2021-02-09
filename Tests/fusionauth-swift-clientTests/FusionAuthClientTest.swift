//
//  FusionAuthClientTest.swift
//  FusionAuth Swift ClientTests
//
//  Created by Everaldlee Johnson on 12/10/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import XCTest
@testable import fusionauth_swift_client

class FusionAuthClientTest: XCTestCase {
    
    let baseUrl:String = "factoryWinventory.ddns.net"
    let apiKey:String = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
    let applicationId:UUID = UUID.init(uuidString: "d5b8a58a-4ceb-4a69-b9d9-0dd706774c14")!
    
    let emailAddress:String = "swiftclient@fusionauth.io"
    let username:String = "swiftClient"
    let password:String = "verySecurePassword:)"
    
    var application:Application?
    var client:FusionAuthClient?
    var token:String?
    var user:User?
    
    var userAction:UserAction?
    var userActionLog:UserActionLog?

    override func setUp() {
        let defaultRestClient = DefaultRESTClient(baseUrl: baseUrl, apiKey:apiKey, urlScheme: "https", port: 443)

        client = FusionAuthClient(fusionAuth: defaultRestClient)
    }

    override func tearDown() {
        application = nil
        client = nil
        user = nil
    }
    
    func AssertSuccess<T>(response: ClientResponse<T>){
        let message:String = response.exception == nil ? "No Errors" : response.exception!.localizedDescription

        XCTAssertNil(response.exception)
        XCTAssertEqual(200, response.statusCode, response.errorResponse != nil ? (response.errorResponse?.ToString())! : message)
        XCTAssertNil(response.errorResponse)
    }
    func AssertStatusCode<T>(response:ClientResponse<T>, expectedCode:Int){
        XCTAssertEqual(expectedCode, response.statusCode, response.errorResponse != nil ? (response.errorResponse?.ToString())! : "No Errors")
        XCTAssertNil(response.errorResponse)
        if expectedCode == 400{
            XCTAssertNotNil(response.errorResponse)
        }else{
            XCTAssertNil(response.errorResponse)
        }
        XCTAssertNil(response.successResponse)
    }
    func AssertMissing<T>(response:ClientResponse<T>){
        XCTAssertEqual(404, response.statusCode, response.errorResponse != nil ? (response.errorResponse?.ToString())! : "No Errors")
        XCTAssertNil(response.exception)
        XCTAssertNil(response.errorResponse)
        XCTAssertNil(response.successResponse)
    }

    func CreateUser(email:String, username:String, password:String, applicationId:UUID) -> ClientResponse<RegistrationResponse>{
        let expectation = XCTestExpectation(description: "Create a User")
        let newUser:User = User(password: password, email: emailAddress, username: username)
        let registration:UserRegistration = UserRegistration(applicationId: applicationId, username: username)
        var userRegisterResponse:ClientResponse<RegistrationResponse> = ClientResponse()

        let registrationRequest:RegistrationRequest = RegistrationRequest(registration: registration, sendSetPasswordEmail: false, skipVerification: true, user: newUser)


        client?.Register(userId: nil, request: registrationRequest, clientResponse: { (response) in
            self.AssertSuccess(response: response)
            userRegisterResponse = response
            self.user = userRegisterResponse.successResponse?.user
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 15)
        return userRegisterResponse
      
    }
    
    func CreateUserAction(actionName:String, isTemporal:Bool){
        client?.RetrieveUserActions(clientResponse: { (retrieveUserAction) in
            self.AssertSuccess(response: retrieveUserAction)
            if retrieveUserAction.WasSuccessful{
                guard let userActions:[UserAction] = retrieveUserAction.successResponse?.userActions else{return}
                if !userActions.isEmpty{
                    for userAction in userActions{
                        if userAction.name == actionName{
                            guard let userActionId:UUID = userAction.id else{return}
                            self.client?.DeleteUserAction(userActionId: userActionId, clientResponse: { (deleteUserActionResponse) in
                                self.AssertSuccess(response: deleteUserActionResponse)
                            })
                        }
                    }
                }
            }
            let userAction:UserAction = UserAction(name: actionName, temporal: isTemporal)
            let userActionRequest:UserActionRequest = UserActionRequest(userAction: userAction)
            
            self.client?.CreateUserAction(userActionId: nil, request: userActionRequest, clientResponse: { (createUserActionResponse) in
                self.AssertSuccess(response: createUserActionResponse)
                self.userAction = createUserActionResponse.successResponse?.userAction
            })
            
          
        })
    }
    
    func ActionUser(){
        let expiry:Date = (userAction?.temporal)! ? Date().advanced(by: 1) : Date()
           let actionData:ActionData = ActionData(actioneeUserId: user?.id, actionerUserId: user?.id, expiry: expiry, userActionId: userAction?.id)
           
           let actionRequest:ActionRequest = ActionRequest(action: actionData, broadcast: false)
           
           client?.ActionUser(request: actionRequest, clientResponse: { actionUserResponse in
               self.AssertSuccess(response: actionUserResponse)
               self.userActionLog = actionUserResponse.successResponse?.action
           })
    }
    
    func Login(){
        let loginRequest:LoginRequest = LoginRequest(applicationId: application?.id, loginId: user?.email, password: "password")
        client?.Login(request: loginRequest, clientResponse: { loginResponse in
            self.AssertSuccess(response: loginResponse)
            
            self.token = loginResponse.successResponse?.token
            self.user = loginResponse.successResponse?.user
        })
    }
    
    func UpdateApplication(application:Application){
        let applicationRequest:ApplicationRequest = ApplicationRequest(application: application)
        client?.UpdateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { updateApplicationResponse in
            self.AssertSuccess(response: updateApplicationResponse)
            self.application = updateApplicationResponse.successResponse?.application
        })
    }
    
    func CreateApplication(){
        client?.RetrieveApplication(applicationId: applicationId, clientResponse: { retrieveApplicationResponse in
            if retrieveApplicationResponse.WasSuccessful{
                self.client?.DeleteApplication(applicationId: self.applicationId, clientResponse: { deleteApplicationResponse in
                    self.AssertSuccess(response: deleteApplicationResponse)
                })
            }
        })
        
        let application:Application = Application(name: "Swift Client Test")
        let applicationRequest:ApplicationRequest = ApplicationRequest(application: application)
        client?.CreateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { createApplicationResponse in
            self.AssertSuccess(response: createApplicationResponse)
            XCTAssertEqual(application.name, createApplicationResponse.successResponse?.application?.name)
            self.application = createApplicationResponse.successResponse?.application
        })
    }
    
    func testPatchApplication(){
        CreateApplication()
        
        
    }
    
    
    
}
