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
    var apiKey:String = "E9XCHRTDFwc0x_JcdcGmi78PEpcl2PdMcl0pines2DB4Df3jQHjG-Sm-"
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

    func CreateUser(complete:@escaping(Bool) -> ()){
        client?.RetrieveUserByEmail(email: emailAddress, clientResponse: { (retrieveUserResponse) in
            if retrieveUserResponse.WasSuccessful{
                guard let userId:UUID = retrieveUserResponse.successResponse?.user?.id else{return}
                self.client?.DeleteUser(userId: userId, hardDelete: true, clientResponse: { (deleteUserResponse) in
                    self.AssertSuccess(response: deleteUserResponse)
                    CreateUser()
                })
            }else{
                CreateUser()
            }
        })
        
        func CreateUser(){
            let newUser:User = User(email: emailAddress, password: password, username: username)
            let registration:UserRegistration = UserRegistration(applicationId: applicationId, username: username)
            let registrationRequest:RegistrationRequest = RegistrationRequest(registration: registration, sendSetPasswordEmail: false, skipVerification: true, user: newUser)

            client?.Register(userId: nil, request: registrationRequest, clientResponse: { (registerUserResponse) in
                self.AssertSuccess(response: registerUserResponse)
                guard let userName:String = registerUserResponse.successResponse?.user?.username else{return}
                XCTAssertEqual(newUser.username, userName)
                self.user = registerUserResponse.successResponse?.user
                complete(true)
            })
        }
    }
    
    func CreateUserAction(actionName:String, isTemporal:Bool, complete:@escaping(Bool) -> ()){
       
        client?.RetrieveUserActions(clientResponse: { (retrieveUserActionResponse) in
            print("retrieveUserActionResponse")
            dump(retrieveUserActionResponse)
            self.AssertSuccess(response: retrieveUserActionResponse)
            if retrieveUserActionResponse.WasSuccessful{
                if let userActions = retrieveUserActionResponse.successResponse?.userActions{
                    for userAction in userActions{
                        if userAction.name == actionName{
                            guard let userActionId:UUID = userAction.id else{return}
                            self.client?.DeleteUserAction(userActionId: userActionId, clientResponse: { (deleteUserActionResponse) in
                                self.AssertSuccess(response: deleteUserActionResponse)
                            })
                        }
                    }
                }
                CreateUserAction()
            }
        })
        
        func CreateUserAction(){
            let userAction:UserAction = UserAction(name: actionName, temporal: isTemporal)
            let userActionRequest:UserActionRequest = UserActionRequest(userAction: userAction)
            
            self.client?.CreateUserAction(userActionId: nil, request: userActionRequest, clientResponse: { (createUserActionResponse) in
                dump(createUserActionResponse.WasSuccessful)
                self.AssertSuccess(response: createUserActionResponse)
                self.userAction = createUserActionResponse.successResponse?.userAction
                //expect.fulfill()
                complete(true)
            })
        }
    }
    
    func ActionUser(complete:@escaping(Bool) -> ()){
        let date:Date = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
        let expiry:Date = (userAction?.temporal)! ? date : Date()
        let actionData:ActionData = ActionData(actioneeUserId: user?.id, actionerUserId: user?.id, expiry: expiry, userActionId: userAction?.id)
        
        let actionRequest:ActionRequest = ActionRequest(action: actionData, broadcast: false)
           
        client?.ActionUser(request: actionRequest, clientResponse: { actionUserResponse in
            self.AssertSuccess(response: actionUserResponse)
            self.userActionLog = actionUserResponse.successResponse?.action
            complete(true)
        })
    }
    
    func Login(complete:@escaping(Bool) -> ()){
        let loginRequest:LoginRequest = LoginRequest(applicationId: application?.id, loginId: user?.email, password: password)
        client?.Login(request: loginRequest, clientResponse: { loginResponse in
            self.AssertSuccess(response: loginResponse)
            self.token = loginResponse.successResponse?.token
            self.user = loginResponse.successResponse?.user
            complete(true)
        })
    }
    
    func UpdateApplication(application:Application, complete:@escaping (Bool) -> ()){
        let applicationRequest:ApplicationRequest = ApplicationRequest(application: application)
        client?.UpdateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { updateApplicationResponse in
            self.AssertSuccess(response: updateApplicationResponse)
            self.application = updateApplicationResponse.successResponse?.application
            complete(true)
        })
    }
    
    func CreateApplication(complete:@escaping (Bool) ->() ){
        client?.RetrieveApplication(applicationId: applicationId, clientResponse: { retrieveApplicationResponse in
            if retrieveApplicationResponse.WasSuccessful{
                self.client?.DeleteApplication(applicationId: self.applicationId, clientResponse: { deleteApplicationResponse in
                    self.AssertSuccess(response: deleteApplicationResponse)
                    createApplication()
                    
                })
            }else{
                createApplication()
            }
        })
        
        func createApplication(){
            let application:Application = Application(name: "Swift Client Test")
            let applicationRequest:ApplicationRequest = ApplicationRequest(application: application)
            client?.CreateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { createApplicationResponse in
                self.AssertSuccess(response: createApplicationResponse)
                guard let name = createApplicationResponse.successResponse?.application?.name else{return}
                XCTAssertEqual(application.name, name)
                
                self.application = createApplicationResponse.successResponse?.application
                complete(true)
            })
        }
    }
    
    func testPatchApplication(){
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        let expect:XCTestExpectation = XCTestExpectation()
        CreateApplication { complete in
            let registrationConfiguration:RegistrationConfiguration = RegistrationConfiguration(enabled:true)
            let passwordlessConfiguration:PasswordlessConfiguration = PasswordlessConfiguration(enabled: false)
            
            let application:Application = Application(passwordlessConfiguration: passwordlessConfiguration, registrationConfiguration:registrationConfiguration)
            let request:ApplicationRequest = ApplicationRequest(application:application)
            
            self.client?.PatchApplication(applicationID: self.applicationId, request: request, clientResponse: { (patchApplicationResponse) in
                self.AssertSuccess(response: patchApplicationResponse)
                if patchApplicationResponse.WasSuccessful{
                    self.client?.RetrieveApplication(applicationId: self.applicationId, clientResponse: { (retrieveApplicationResponse) in
                        self.AssertSuccess(response: retrieveApplicationResponse)
                        if retrieveApplicationResponse.WasSuccessful{
                            guard let passwordlessConfig = patchApplicationResponse.successResponse?.application?.passwordlessConfiguration?.enabled else{return}
                            guard let registrationConfig = patchApplicationResponse.successResponse?.application?.registrationConfiguration?.enabled else{return}
                            
                            XCTAssertFalse(passwordlessConfig)
                            XCTAssertTrue(registrationConfig)
                        }
                        
                        expect.fulfill()
                    })
                }
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testCancelAction(){
        let expect:XCTestExpectation = XCTestExpectation()
        CreateApplication { caComplete in
            self.CreateUserAction(actionName: "SwiftClientUserAction", isTemporal: true) { (cuaComplete) in
                self.CreateUser { cuComplete in
                    self.ActionUser { auComplete in
                        cancelAction()
                    }
                }
            }
        }
        
        func cancelAction(){
            let action:ActionData = ActionData(actionerUserId: user?.id, comment: "Cancel Action")
            let request:ActionRequest = ActionRequest(action:action)
            
            guard let userActionLogId = userActionLog?.id else {return}
            client?.CancelAction(actionId: userActionLogId, request: request, clientResponse: { cancelActionResponse in
                self.AssertSuccess(response: cancelActionResponse)
                expect.fulfill()
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testCreateTenant(){
        let expect:XCTestExpectation = XCTestExpectation()
        client?.RetrieveTenants(clientResponse: { retrieveTenantsResponse in
            self.AssertSuccess(response: retrieveTenantsResponse)
            let eventConfigurationData:EventConfigurationData = EventConfigurationData(enabled: true)
            let eventConfiguration:EventConfiguration = EventConfiguration(events: [EventType.UserDelete.rawValue: eventConfigurationData])
            var tenant = retrieveTenantsResponse.successResponse?.tenants?[2]
            tenant?.name = "Swift Tenant"
            tenant?.eventConfiguration = eventConfiguration
            let tenantRequest:TenantRequest = TenantRequest(tenant:tenant)
            
            dump(tenant)
            
            self.client?.CreateTenant(tenantId: nil, request: tenantRequest, clientResponse: { createTenantResponse in
                self.AssertSuccess(response: createTenantResponse)
                guard let id = createTenantResponse.successResponse?.tenant?.id else{return}
                self.client?.RetrieveTenant(tenantId: id, clientResponse: { retrieveTenantResponse in
                    self.AssertSuccess(response: retrieveTenantResponse)
                    let userDeleteEvent = retrieveTenantResponse.successResponse?.tenant?.eventConfiguration?.events?[EventType.UserDelete.rawValue]
                    XCTAssertNotNil(userDeleteEvent)
                    XCTAssertTrue((userDeleteEvent!.enabled)!)
                    
                    self.client?.DeleteTenant(tenantId: id, clientResponse: { deleteTenantResponse in
                        self.AssertSuccess(response: deleteTenantResponse)
                        expect.fulfill()
                    })
                })
            })
        })
        wait(for: [expect], timeout: 30)
    }
    
    func testRetrieveApplication(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { complete in
            self.client?.RetrieveApplication(applicationId: self.application?.id, clientResponse: { retrieveApplicationResponse in
                XCTAssertEqual("Swift Client Test", retrieveApplicationResponse.successResponse?.application?.name)
                self.AssertSuccess(response: retrieveApplicationResponse)
                expect.fulfill()
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testRetrieveRefreshTokensTest(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            self.CreateUser { cuComplete in
                RetrieveRefreshTokens()
            }
        }
        
        func RetrieveRefreshTokens(){
            guard let id = user?.id else{return}
            client?.RetrieveRefreshTokens(userId: id, clientResponse: { retrieveRefreshTokensResponse in
                self.AssertSuccess(response: retrieveRefreshTokensResponse)
                XCTAssertNil(retrieveRefreshTokensResponse.successResponse?.refreshTokens)
                expect.fulfill()
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testUpdateApplication(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            var app = self.application!
            app.name = "Swift Client Test (Updated)"
            self.UpdateApplication(application: app) { uaComplete in
                UpdateApplication()
            }
        }
        func UpdateApplication(){
            let application:Application = .init( name: "Swift Client Test (updated)")
            let applicationRequest:ApplicationRequest = .init(application:application)
            client?.UpdateApplication(applicationId: applicationId, request: applicationRequest, clientResponse: { uaComplete in
                guard let name = uaComplete.successResponse?.application?.name else{return}
                XCTAssertEqual("Swift Client Test (updated)", name)
                self.AssertSuccess(response: uaComplete)
                expect.fulfill()
            })
            
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testValidateJWT(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            self.CreateUser { cuComplete in
                self.Login { loginComplete in
                    ValidateJWT()
                }
            }
        }

        func ValidateJWT(){
            client?.ValidateJWT(encodedJWT: token!, clientResponse: { validateJWTResponse in
                dump(validateJWTResponse)
                self.AssertSuccess(response: validateJWTResponse)
                guard let jwt = validateJWTResponse.successResponse?.jwt else{return}
                dump(jwt.otherClaims)
                guard let userId = self.user?.id else{return}
                guard let appId = self.application?.id else{return}
                XCTAssertEqual(jwt.sub, userId.uuidString.lowercased())
                XCTAssertEqual(jwt.otherClaims!["applicationId"]?.jsonString(), appId.uuidString.lowercased())
                expect.fulfill()
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testRetrievePublicKeysTest(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            self.CreateUser { cuComplete in
                RetrievePublicKeys()
            }
        }
        
        // No Application Specific Public Keys
        func RetrievePublicKeys(){
            client?.RetrieveJWTPublicKey(keyId: applicationId.uuidString, clientResponse: { retrieveJWTKeyResponse in
                self.AssertMissing(response: retrieveJWTKeyResponse)
                
                self.client?.RetrieveJWTPublicKeys(clientResponse: { retrieveJWTKeysResponse in
                    self.AssertSuccess(response: retrieveJWTKeysResponse)
                    expect.fulfill()
                })
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    func testDeactivateApplication(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            self.client?.DeactivateApplication(applicationId: self.applicationId, clientResponse: { daApplicationResponse in
                self.AssertSuccess(response: daApplicationResponse)
                print("I am working")
                expect.fulfill()
            })
        }
        wait(for: [expect], timeout: 30)
    }
    
    
    
    func testReactivateApplication(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        
        testDeactivateApplication()

        client?.ReactivateApplication(applicationId: applicationId, clientResponse: { [self] raApplication in
            self.AssertSuccess(response: raApplication)
            self.client?.RetrieveApplication(applicationId: self.applicationId, clientResponse: { retrieveResponse in
                guard let name = retrieveResponse.successResponse?.application?.name else{return}
                guard let active = retrieveResponse.successResponse?.application?.active else{return}
                XCTAssertEqual("Swift Client Test", name)
                XCTAssertTrue(active)
                self.AssertSuccess(response: retrieveResponse)
                expect.fulfill()
            })
        })
        wait(for: [expect], timeout: 30)
    }
    
    func testRegister(){
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        CreateApplication { caComplete in
            self.CreateUser { cuComplete in
                RetrieveRegistration()
            }
        }
        
        func RetrieveRegistration(){
            client?.RetrieveRegistration(userId: (user?.id)!, applicationId: applicationId, clientResponse: { retrieveRegistrationResponse in
                XCTAssertEqual(self.user?.username, retrieveRegistrationResponse.successResponse?.registration?.username)
                self.AssertSuccess(response: retrieveRegistrationResponse)
                UpdateRegistration()
            })
        }
        
        func UpdateRegistration(){
            let userRegistration:UserRegistration = UserRegistration(applicationId: applicationId, cleanSpeakId: UUID(uuidString: "9af3fc1d-9236-4793-93df-aeac5f67f23e"), username: user?.username, usernameStatus: .ACTIVE)
            let registrationRequest:RegistrationRequest = RegistrationRequest(registration:userRegistration)
            client?.UpdateRegistration(userId: (user?.id)!, request: registrationRequest, clientResponse: { updateRegistrationResponse in
                XCTAssertEqual(self.user?.username, updateRegistrationResponse.successResponse?.registration?.username)
                self.AssertSuccess(response: updateRegistrationResponse)
                DeleteUserAndRegistration()
            })
        }
        
        func DeleteUserAndRegistration(){
            client?.DeleteRegistration(userId: (user?.id)!, applicationId: applicationId, clientResponse: { deleteRegistrationResponse in
                self.AssertSuccess(response: deleteRegistrationResponse)
                self.client?.DeleteUser(userId: (self.user?.id)!, hardDelete: true, clientResponse: { deleteUserResponse in
                    RetrieveEmptyRegistration()
                })
            })
        }
        
        func RetrieveEmptyRegistration(){
            let randomUserId:UUID = UUID(uuidString: "f64992f5-c705-47b2-bc88-4046ac8a82ee")!
            client?.RetrieveRegistration(userId: randomUserId, applicationId: applicationId, clientResponse: { retrieveEmptyRegistrationResponse in
                self.AssertMissing(response: retrieveEmptyRegistrationResponse)
                expect.fulfill()
            })
        }
        
        wait(for: [expect], timeout: 30)
    }
    
    func testSystemConfiguration() {
        let expect:XCTestExpectation = XCTestExpectation()
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        client?.RetrieveSystemConfiguration(clientResponse: { retrieveSystemConfigResponse in
            self.AssertSuccess(response: retrieveSystemConfigResponse)
            expect.fulfill()
        })
        wait(for: [expect], timeout: 30)
    }

    
    
    
    
    
    
    
    
}
