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

    let apiKey:String = "-cpbXSCFMXl3ZZjmkVIC-nRS8cqr5Atit3mm324Mp6U"
    let applicationId:UUID = UUID.init()
    let emailAddress:String = "swiftclient@fusionauth.io"
    let username:String = "swiftClient"
    let password:String = "verySecurePassword:)"

    var application:Application?
    var client:FusionAuthClient?
    var token:String?
    var user:User?

    override func setUp() {

        client = FusionAuthClient(baseUrl: "159.203.191.202", port: 80)
    }

    override func tearDown() {
        application = nil
        client = nil
        user = nil
    }

    func newFusionAuthClient(tenantId:UUID) -> FusionAuthClient{
        return FusionAuthClient(apiKey: apiKey, baseUrl: "159.203.191.202", tenantId: tenantId.uuidString)
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
                expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 15)
        return userRegisterResponse
      
    }
    
    func DeleteUser(userId:UUID) -> ClientResponse<RESTVoid>{
        let expectation = XCTestExpectation(description: "Delete User")
        var deleteUserResponse:ClientResponse<RESTVoid> = ClientResponse()
        client?.DeleteUser(userId: userId, hardDelete: true, clientResponse: { (response) in
            deleteUserResponse = response
            expectation.fulfill()
        })
         wait(for: [expectation], timeout: 15)
        return deleteUserResponse
    }

    func RetrieveUserByEmail(emailAddress:String) -> ClientResponse<UserResponse>{
        let expectation = XCTestExpectation(description: "Retrieve User By Email")
        var retrieveUserByEmailResponse:ClientResponse<UserResponse> = ClientResponse()

        client?.RetrieveUserByEmail(email: emailAddress, clientResponse: { (response) in
            retrieveUserByEmailResponse = response
            dump(response)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 15)
        
        return retrieveUserByEmailResponse
    }

    func CreateApplication(applicationName:String) -> ClientResponse<ApplicationResponse>{
        let expectation = XCTestExpectation(description: "Create Application")
        var createApplicationResponse:ClientResponse<ApplicationResponse> = ClientResponse()

        let application:Application = Application(name: applicationName)
        let applicationRequest:ApplicationRequest = ApplicationRequest(application: application )

        client?.CreateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { (response) in
                createApplicationResponse = response
                expectation.fulfill()

        })

        wait(for: [expectation], timeout: 15)
        return createApplicationResponse
    }

    func UpdateApplication(application:Application, applicationId:UUID) -> ClientResponse<ApplicationResponse>{
        let expectation = XCTestExpectation(description: "Delete Application")
        var updateApplicationResponse:ClientResponse<ApplicationResponse> = ClientResponse()
        let applicationRequest:ApplicationRequest = ApplicationRequest(application: application)

        client?.UpdateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { (response) in
            updateApplicationResponse = response
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15)
        return updateApplicationResponse
    }

    func DeleteApplication(applicationId:UUID) -> ClientResponse<RESTVoid>{
        let expectation = XCTestExpectation(description: "Delete Application")
        var deleteApplicationResponse:ClientResponse<RESTVoid> = ClientResponse()

        client?.DeleteApplication(applicationId: applicationId, clientResponse: { (response) in
            deleteApplicationResponse = response
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15)
        return deleteApplicationResponse
    }

    func CreateRegistration(userId:UUID, applicationId: UUID, username:String) -> ClientResponse<RegistrationResponse>{
        let expectation = XCTestExpectation(description: "Create Registration")
        var createRegistrationResponse:ClientResponse<RegistrationResponse> = ClientResponse()
        let userRegistration:UserRegistration = UserRegistration(applicationId: applicationId, username: username)
        let registrationRequest:RegistrationRequest = RegistrationRequest(registration: userRegistration, sendSetPasswordEmail: false, skipVerification: true)

        client?.Register(userId: userId, request: registrationRequest, clientResponse: { (response) in
            createRegistrationResponse = response
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15)
        return createRegistrationResponse
    }

    func DeleteRegistration(userId:UUID, applicationId:UUID) -> ClientResponse<RESTVoid>{
        let expectation = XCTestExpectation(description: "Delete Registration")
        var deleteRegistrationResponse:ClientResponse<RESTVoid> = ClientResponse()

        client?.DeleteRegistration(userId: userId , applicationId: applicationId, clientResponse: { (response) in
            deleteRegistrationResponse = response
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15)
        return deleteRegistrationResponse

    }

    func Login(applicationId:UUID, loginId:String, password:String) -> ClientResponse<LoginResponse>{
        let expectation = XCTestExpectation(description: "Login")
        var loginResponse:ClientResponse<LoginResponse> = ClientResponse()
        let loginRequest:LoginRequest = LoginRequest(applicationId: applicationId, loginId: loginId, password: password)

        client?.Login(request: loginRequest, clientResponse: { (response) in
            loginResponse = response
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15)
        return loginResponse
    }

    func testCreateApplication(){
         let application:Application = Application(name: "Swift Client Test")
         let createApplicationResponse:ClientResponse<ApplicationResponse> = CreateApplication(applicationName: "Swift Client Test")

        if createApplicationResponse.WasSuccessful{
            print("Create Application Command Successful")
            self.AssertSuccess(response: createApplicationResponse)
            XCTAssertEqual(application.name, createApplicationResponse.successResponse?.application?.name)
            self.application = createApplicationResponse.successResponse?.application
        }else{
            print("Create Application Command Failed")
            dump(createApplicationResponse.errorResponse)
            dump(createApplicationResponse.exception)
            XCTFail()
        }

     }

    func testUpdateApplication(){
        let application:Application = Application(name: "Swift Client Test")
        let updateApplicationResponse:ClientResponse<ApplicationResponse> = UpdateApplication(application: application, applicationId: applicationId)

        if updateApplicationResponse.WasSuccessful{
            print("Update Application Command Successful")
            self.AssertSuccess(response: updateApplicationResponse)
            self.application = updateApplicationResponse.successResponse?.application
        }else{
            print("Update Application Command Failed")
            dump(updateApplicationResponse.errorResponse)
            dump(updateApplicationResponse.exception)
            XCTFail()
        }
    }

    func testDeleteApplication(){
        let deleteApplicationResponse:ClientResponse<RESTVoid> = DeleteApplication(applicationId: applicationId)

        if deleteApplicationResponse.WasSuccessful{
            print("Delete Application Command Successful")
            AssertSuccess(response: deleteApplicationResponse)
        }else{
            print("Delete Application Command Failed")
            dump(deleteApplicationResponse.errorResponse)
            dump(deleteApplicationResponse.exception)
            XCTFail()
        }

    }

    func testCreateUser(){
        let createUserResponse = CreateUser(email: emailAddress, username: username, password: password, applicationId: applicationId)

        if createUserResponse.WasSuccessful{
            print("Create User Command Successful")
            self.AssertSuccess(response: createUserResponse)
            XCTAssertEqual(username, createUserResponse.successResponse?.user?.username)
            user = createUserResponse.successResponse?.user
        }else{
            print("Create User Command Failed")
            dump(createUserResponse.errorResponse)
            dump(createUserResponse.exception)
            XCTFail()
        }
    }

    func testRetrieveUserByEmail(){
        let retrieveUserByEmailResponse = RetrieveUserByEmail(emailAddress: emailAddress)

        if retrieveUserByEmailResponse.WasSuccessful{
            print("Retieve User Command Successful")
            self.AssertSuccess(response: retrieveUserByEmailResponse)
        }else{
            print("Retrieve User Command Failed")
            dump(retrieveUserByEmailResponse.errorResponse)
            dump(retrieveUserByEmailResponse.exception)
            XCTFail()
        }
    }
    
    func testDeleteUser(){
        let retrieveUserByEmailResponse = RetrieveUserByEmail(emailAddress: emailAddress)
        
        if retrieveUserByEmailResponse.WasSuccessful{
            print("Retrieve User Command Successful")
            let deleteUserResponse = DeleteUser(userId: (retrieveUserByEmailResponse.successResponse?.user!.id)!)
            if deleteUserResponse.WasSuccessful{
                print("Delete User Command Successful")
                self.AssertSuccess(response: deleteUserResponse)
            }else{
                print("Delete User Command Failed")
                dump(deleteUserResponse.errorResponse)
                dump(deleteUserResponse.exception)
                XCTFail()
            }

        }else{
            print("Retrieve User Command Failed")
            dump(retrieveUserByEmailResponse.errorResponse)
            dump(retrieveUserByEmailResponse.exception)
            XCTFail()
        }
    }

    func testCreateRegistration(){
        let retrieveUserId = (RetrieveUserByEmail(emailAddress: emailAddress).successResponse?.user?.id)!
        let createRegistrationResponse = CreateRegistration(userId: retrieveUserId, applicationId: applicationId, username: username)

        if createRegistrationResponse.WasSuccessful{
            print("Create Registration Command Successful")
            self.AssertSuccess(response: createRegistrationResponse)
        }else{
            print("Create Registration Command Failed")
            dump(createRegistrationResponse.errorResponse)
            dump(createRegistrationResponse.exception)
            XCTFail()
        }

    }

    func testDeleteRegistration(){
        let retrieveUserId = (RetrieveUserByEmail(emailAddress: emailAddress).successResponse?.user?.id)!
        let deleteRegistrationResponse = DeleteRegistration(userId: retrieveUserId, applicationId: applicationId)

        if deleteRegistrationResponse.WasSuccessful{
            print("Delete Registration Command Successful")
            self.AssertSuccess(response: deleteRegistrationResponse)
        }else{
            print("Delete Registration Command Failed")
            dump(deleteRegistrationResponse.errorResponse)
            dump(deleteRegistrationResponse.exception)
            XCTFail()
        }
    }

    func testLogin(){
        let loginResponse = Login(applicationId: applicationId, loginId: username, password: password)
        dump(loginResponse)

        if loginResponse.WasSuccessful{
            print("Login Command Successful")
            AssertSuccess(response: loginResponse)
            user = loginResponse.successResponse?.user
            token = loginResponse.successResponse?.token
        }else{
            print("Login Command Failed")
            dump(loginResponse.errorResponse)
            dump(loginResponse.exception)
        }

    }

    func testRetrieveTenants(){
        let expectation:XCTestExpectation = XCTestExpectation()



        client?.RetrieveTenants(clientResponse: { (response) in
            dump(response)

            guard let retrieveTenantsResponse:TenantResponse = response.successResponse else{return}

            guard let responseTenants:[Tenant] = retrieveTenantsResponse.tenants else{return}

            var tenantList:[String] = []
            for x in responseTenants{
                dump(x)
                guard let tenantName:String = x.name else{return}
                tenantList.append(tenantName)
            }

            if tenantList.contains("test7"){
                print("true")
            }else{
                print("false")
            }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 10)
    }

    func testLoginPing(){
        let expectation:XCTestExpectation = XCTestExpectation()
        guard let userId:UUID = UUID(uuidString: "df805912-6464-4e7a-9794-149e7ae12569") else{return}
        guard let applicationId:UUID = UUID(uuidString: "71721ce5-2f86-416b-b0f6-742feb25096c") else{return}
        client?.LoginPing(userId: userId, applicationId: applicationId, callerIPAddress: "192.168.1.1", clientResponse: { response in
            dump(response)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)

    }



}
