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
    
    func NewClientWithTenantId(tenantId:String) -> FusionAuthClient{
        let RestClientWithTenantId = DefaultRESTClient(baseUrl: baseUrl, apiKey: apiKey, tenantId: tenantId, urlScheme: "https", port: 443)
        return FusionAuthClient(fusionAuth: RestClientWithTenantId)
    }
    
    
    func AssertSuccess<T>(response: ClientResponse<T>){
        let message:String = response.exception == nil ? "No Errors" : response.exception!.localizedDescription

        XCTAssertNil(response.exception)
        XCTAssertEqual(200, response.statusCode, response.errorResponse != nil ? (response.errorResponse?.ToString())! : message)
        XCTAssertNil(response.errorResponse)
    }
    func AssertStatusCode<T>(response:ClientResponse<T>, expectedCode:Int){
        XCTAssertEqual(expectedCode, response.statusCode, response.errorResponse != nil ? (response.errorResponse?.ToString())! : "No Errors")
        XCTAssertNil(response.exception)
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
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
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
                self.AssertSuccess(response: validateJWTResponse)
                guard let jwt = validateJWTResponse.successResponse?.jwt else{return}
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
    
    func testGroups(){
        apiKey = "a2LMkmZzCODNvRPbIQ8k-dQ3idlxnshffTTINyCzox_BhuDR6psCYmKw"
        setUp()
        func CreateGroups() -> ClientResponse<GroupResponse>{
            var createGroupResponse:ClientResponse<GroupResponse> = ClientResponse()
            let expect = XCTestExpectation()
            let group:Group = Group( name: "Swift Group")
            let groupRequest:GroupRequest = GroupRequest(group:group)
            client?.CreateGroup(groupId: nil, request: groupRequest, clientResponse: { (cgResponse) in
                 createGroupResponse = cgResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createGroupResponse
        }
        
        func RetrieveGroup(fusionAuthClient:FusionAuthClient, groupId:UUID) -> ClientResponse<GroupResponse>{
            var groupResponse:ClientResponse<GroupResponse> = ClientResponse()
            let expect = XCTestExpectation()
            fusionAuthClient.RetrieveGroup(groupId: groupId, clientResponse: { rgResponse in
                groupResponse = rgResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return groupResponse
        }
        
        func RetrieveGroups(fusionAuthClient:FusionAuthClient) -> ClientResponse<GroupResponse>{
            var groupResponse:ClientResponse<GroupResponse> = ClientResponse()
            let expect = XCTestExpectation()
            fusionAuthClient.RetrieveGroups(clientResponse: { rgResponse in
                groupResponse = rgResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return groupResponse
        }
        
        func DeleteGroups(groupId:UUID){
            let expect = XCTestExpectation()
            client?.DeleteGroup(groupId: groupId, clientResponse: { _ in
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
        }
        
        func createTenant(tenantId:UUID) -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var createTenantResponse:ClientResponse<TenantResponse> = ClientResponse()
            let tenant:Tenant = Tenant(name: "Swift Tenant")
            let tenantRequest:TenantRequest = TenantRequest(sourceTenantId: tenantId, tenant: tenant)
            client?.CreateTenant(tenantId: nil, request: tenantRequest, clientResponse: { ctResponse in
                createTenantResponse = ctResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createTenantResponse
        }
        
        func deleteTenant(tenantId:UUID) -> ClientResponse<RESTVoid>{
            let expect = XCTestExpectation()
            var deleteTenantResponse:ClientResponse<RESTVoid> = ClientResponse()
            client?.DeleteTenant(tenantId: tenantId, clientResponse: { dtResponse in
                deleteTenantResponse = dtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return deleteTenantResponse
        }
        
        var retrieveResponse = RetrieveGroups(fusionAuthClient: client!)
        AssertSuccess(response: retrieveResponse)
        
        if let groups = retrieveResponse.successResponse?.groups{
            if ((!groups.isEmpty) && (groups.count > 0 )){
                for g in groups{
                    if (g.name == "Swift Group"){
                        if let id = g.id{
                            DeleteGroups(groupId: id)
                        }
                    }
                }
            }
        }
        
        let createResponse = CreateGroups()
        AssertSuccess(response: createResponse)
        retrieveResponse = RetrieveGroups(fusionAuthClient: client!)
        AssertSuccess(response: retrieveResponse)
        
        // Use a tenantId
        apiKey = "E9XCHRTDFwc0x_JcdcGmi78PEpcl2PdMcl0pines2DB4Df3jQHjG-Sm-"
        setUp()
        func RetrieveTenants() -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var retrieveTenants:ClientResponse<TenantResponse> = ClientResponse()
            client?.RetrieveTenants(clientResponse: { rtResponse in
                retrieveTenants = rtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return retrieveTenants
        }
        
        let tenantResponse = RetrieveTenants()
        AssertSuccess(response: tenantResponse)
        guard let tenantId = tenantResponse.successResponse?.tenants?[2].id else{return XCTFail()}
        let tenantClient = NewClientWithTenantId(tenantId: tenantId.uuidString)
        var tenantGroupRetrieveResponse = RetrieveGroup(fusionAuthClient: tenantClient, groupId: (createResponse.successResponse?.group?.id)!)
        AssertSuccess(response: tenantGroupRetrieveResponse)
        
        // 400, bad tenant Id
        
        let badTenantClient = NewClientWithTenantId(tenantId: UUID.init().uuidString)
        
        tenantGroupRetrieveResponse = RetrieveGroup(fusionAuthClient: badTenantClient, groupId: (createResponse.successResponse?.group?.id)!)
        AssertStatusCode(response: tenantGroupRetrieveResponse, expectedCode: 400)
        
        // 404, Wrong tenant Id
    
        let createTenantResponse = createTenant(tenantId: tenantId)
        AssertSuccess(response: createTenantResponse)
        
        guard let newTenantId = createTenantResponse.successResponse?.tenant?.id else{return XCTFail()}
        let wrongTenantClient = NewClientWithTenantId(tenantId: newTenantId.uuidString)
        
        tenantGroupRetrieveResponse = RetrieveGroup(fusionAuthClient: wrongTenantClient, groupId: (createResponse.successResponse?.group?.id)!)
        AssertMissing(response: tenantGroupRetrieveResponse)
        
        let deleteResponse = deleteTenant(tenantId: (createTenantResponse.successResponse?.tenant?.id)!)
        AssertSuccess(response: deleteResponse)
       
    }
    
    func testIdentityProviders(){
        func CreateIdentityProvider() -> ClientResponse<IdentityProviderResponse>{
            let expect = XCTestExpectation()
            var createIdentityProviderResponse:ClientResponse<IdentityProviderResponse> = ClientResponse()
            let externalJWTIdentityProvider = ExternalJWTIdentityProvider(name: "Swift IdentityProvider", headerKeyParameter: "kid", uniqueIdentityClaim: "username")
            let identityProvider = IdentityProviderConverter.ExternalJWT(externalJWTIdentityProvider)
            let identityProviderRequest:IdentityProviderRequest = .init(identityProvider: identityProvider)
            
            client?.CreateIdentityProvider(identityProviderId: nil, request: identityProviderRequest, clientResponse: { cipResponse in
                createIdentityProviderResponse = cipResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createIdentityProviderResponse
        }
        
        func RetrieveIdentityProviders() -> ClientResponse<IdentityProviderResponse> {
            let expect = XCTestExpectation()
            var identityProvidersResponse:ClientResponse<IdentityProviderResponse> = ClientResponse()
            client?.RetrieveIdentityProviders(clientResponse: { riResponse in
                identityProvidersResponse = riResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return identityProvidersResponse
        }
        
        func DeleteIdentityProvider(id:UUID) -> ClientResponse<RESTVoid>{
            let expect = XCTestExpectation()
            var deleteIdentityProviderResponse:ClientResponse<RESTVoid> = ClientResponse()
            client?.DeleteIdentityProvider(identityProviderId: id, clientResponse: { dipResponse in
                deleteIdentityProviderResponse = dipResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return deleteIdentityProviderResponse
        }
        
        var retrieveResponse = RetrieveIdentityProviders()
        AssertSuccess(response: retrieveResponse)
        if let idProviders:[IdentityProviderConverter] = retrieveResponse.successResponse?.identityProviders{
            
            if !idProviders.isEmpty && idProviders.count > 0{
                for idp in idProviders{
                    if idp.GetType() == .ExternalJWT{
                        let identityProvider = idp.GetIdentity() as! ExternalJWTIdentityProvider
                        if let name = identityProvider.name{
                            if name == "Swift IdentityProvider"{
                                guard let id = identityProvider.id else{return}
                                _ = DeleteIdentityProvider(id: id)
                            }
                        }
                    }
                        
                }
            }
            
            let createResponse = CreateIdentityProvider()
            AssertSuccess(response: createResponse)
            retrieveResponse = RetrieveIdentityProviders()
            AssertSuccess(response: retrieveResponse)
        }
    }
    
    func testIntegrations(){
        func RetrieveIntegration() -> ClientResponse<IntegrationResponse>{
            let expect = XCTestExpectation()
            var integrationResponse:ClientResponse<IntegrationResponse> = ClientResponse()
            client?.RetrieveIntegrations(clientResponse: { (riResponse) in
                integrationResponse = riResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return integrationResponse
        }
        let response = RetrieveIntegration()
        AssertSuccess(response: response)
        
        XCTAssertNotNil(response.successResponse?.integrations?.cleanSpeak)
        XCTAssertNotNil(response.successResponse?.integrations?.twilio)
    }
    
    func testLogin(){
        func Login() -> ClientResponse<LoginResponse>{
            let expect = XCTestExpectation()
            var loginResponse:ClientResponse<LoginResponse> = ClientResponse()
            let loginRequest = LoginRequest(applicationId: applicationId, ipAddress: "10.0.0.123", loginId: emailAddress, password: password)
            client?.Login(request: loginRequest, clientResponse: { lrComplete in
                loginResponse = lrComplete
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return loginResponse
        }
        CreateApplication { _ in
            self.CreateUser { _ in
                let loginResponse = Login()
                self.AssertSuccess(response: loginResponse)
            }
        }
    }
    
    func testTenant(){
        
        func RetrieveTenants() -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var retrieveTenantsResponse:ClientResponse<TenantResponse> = ClientResponse()
            client?.RetrieveTenants(clientResponse: { rtResponse in
                retrieveTenantsResponse = rtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return retrieveTenantsResponse
        }
        
        func CreateTenant(tenantId:UUID? = nil, tenantRequest:TenantRequest) -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var createTenantsResponse:ClientResponse<TenantResponse> = ClientResponse()
            client?.CreateTenant(tenantId:tenantId, request:tenantRequest, clientResponse: { ctResponse in
                createTenantsResponse = ctResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createTenantsResponse
        }
        
        func DeleteTenant(tenantId:UUID) -> ClientResponse<RESTVoid>{
            let expect = XCTestExpectation()
            var deleteTenantResponse:ClientResponse<RESTVoid> = ClientResponse()
            client?.DeleteTenant(tenantId: tenantId, clientResponse: { dtResponse in
                deleteTenantResponse = dtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return deleteTenantResponse
        }
        
        let response = RetrieveTenants()
        AssertSuccess(response: response)
        
        guard let tenants = response.successResponse?.tenants else{return XCTFail()}
        guard let name = tenants[2].name else{return XCTFail()}
        XCTAssertEqual(name, "Default")
      
        
        // Make a copy of the default tenant
        let tenant:Tenant = Tenant(name:"Swift Tenant")
        let tenantRequest:TenantRequest = TenantRequest(sourceTenantId: tenants[2].id, tenant: tenant)
        
        let createTenantResponse = CreateTenant(tenantId: nil, tenantRequest: tenantRequest)
        AssertSuccess(response: createTenantResponse)
        
        guard let newName = createTenantResponse.successResponse?.tenant?.name else{return XCTFail()}
        guard let id = createTenantResponse.successResponse?.tenant?.id else{return XCTFail()}
        
        XCTAssertEqual(newName, "Swift Tenant")
        XCTAssertNotNil(createTenantResponse.successResponse?.tenant?.id)
        
        let deleteResponse = DeleteTenant(tenantId: id)
        AssertSuccess(response: deleteResponse)
        
    }
    
    func testUnverifiedUserLogin(){
        
        func CreateTenant(tenantId:UUID? = nil, tenantRequest:TenantRequest) -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var createTenantsResponse:ClientResponse<TenantResponse> = ClientResponse()
            client?.CreateTenant(tenantId:tenantId, request:tenantRequest, clientResponse: { ctResponse in
                createTenantsResponse = ctResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createTenantsResponse
        }
        
        func RetrieveTenants() -> ClientResponse<TenantResponse>{
            let expect = XCTestExpectation()
            var retrieveTenantsResponse:ClientResponse<TenantResponse> = ClientResponse()
            client?.RetrieveTenants(clientResponse: { rtResponse in
                retrieveTenantsResponse = rtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return retrieveTenantsResponse
        }
        
        func DeleteTenant(tenantId:UUID) -> ClientResponse<RESTVoid>{
            let expect = XCTestExpectation()
            var deleteTenantResponse:ClientResponse<RESTVoid> = ClientResponse()
            client?.DeleteTenant(tenantId: tenantId, clientResponse: { dtResponse in
                deleteTenantResponse = dtResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return deleteTenantResponse
        }
        
        func RetrieveEmailTemplateResponse() -> ClientResponse<EmailTemplateResponse>{
            let expect = XCTestExpectation()
            var retrieveEmailTemplateResponse:ClientResponse<EmailTemplateResponse> = ClientResponse()
            client?.RetrieveEmailTemplates(clientResponse: { retResponse in
                retrieveEmailTemplateResponse = retResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return retrieveEmailTemplateResponse
        }
        
        func CreateApplication(client:FusionAuthClient, request:ApplicationRequest) -> ClientResponse<ApplicationResponse> {
            let expect = XCTestExpectation()
            var createApplicationResponse:ClientResponse<ApplicationResponse> = ClientResponse()
            client.CreateApplication(applicationId: nil, request: request, clientResponse: { caResponse in
                createApplicationResponse = caResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return createApplicationResponse
        }
        
        func RetrieveApplications() -> ClientResponse<ApplicationResponse>{
            let expect = XCTestExpectation()
            var retrieveApplicationsResponse:ClientResponse<ApplicationResponse> = ClientResponse()
            client?.RetrieveApplications(clientResponse: { raResponse in
                retrieveApplicationsResponse = raResponse
                expect.fulfill()
            })
            wait(for: [expect], timeout: 30)
            return retrieveApplicationsResponse
        }
        
        func Register(client:FusionAuthClient, request:RegistrationRequest) -> ClientResponse<RegistrationResponse>{
            let expect = XCTestExpectation()
            var registerResponse:ClientResponse<RegistrationResponse> = ClientResponse()
            client.Register(userId: nil, request: request) { rResponse in
                registerResponse = rResponse
                expect.fulfill()
            }
            wait(for: [expect], timeout: 30)
            return registerResponse
        }
        
        func Login(client:FusionAuthClient, request:LoginRequest) -> ClientResponse<LoginResponse>{
            let expect = XCTestExpectation()
            var loginResponse:ClientResponse<LoginResponse> = ClientResponse()
            client.Login(request: request) { lresponse in
                loginResponse = lresponse
                expect.fulfill()
            }
            wait(for: [expect], timeout: 30)
            return loginResponse
        }
        
        var tenantResponse = RetrieveTenants()
        AssertSuccess(response: tenantResponse)
        
        // Retrieve the default verification template
        let emailTemplateResponse = RetrieveEmailTemplateResponse()
        AssertSuccess(response: emailTemplateResponse)
        guard let emailVerificationTemplate = emailTemplateResponse.successResponse?.emailTemplates?[0] else {return XCTFail("Email Template is Nil")}
        
        guard let tenants = tenantResponse.successResponse?.tenants else{return XCTFail("Tenants is nil")}
        
        var newTenant:Tenant = Tenant()
        
        for tenant in tenants{
            if tenant.name == "Default" {
                newTenant = tenant
                newTenant.emailConfiguration?.verifyEmail = true
                newTenant.emailConfiguration?.verificationEmailTemplateId = emailVerificationTemplate.id
                newTenant.name = "Verification Required Tenant"
                newTenant.id = nil
            }
        }

        let tenantRequest = TenantRequest(tenant:newTenant)
        tenantResponse = CreateTenant(tenantRequest: tenantRequest)
        AssertSuccess(response: tenantResponse)
        
        guard let verificationRequiredTenant = tenantResponse.successResponse?.tenant else{return XCTFail("Tenant is nil")}
        
        // Create a new application within the new tenant requiring email verification
        var applicationResponse = RetrieveApplications()
        AssertSuccess(response: applicationResponse)
        
        var verificationRequiredApplication:Application = Application(name:"Verification Required Tenant", tenantId: verificationRequiredTenant.id!)
        
        let tenantClient = NewClientWithTenantId(tenantId: verificationRequiredTenant.id!.uuidString)
        
        let applicationRequest = ApplicationRequest(application:verificationRequiredApplication)
        
        applicationResponse = CreateApplication(client: tenantClient, request: applicationRequest)
        AssertSuccess(response: applicationResponse)
        
        verificationRequiredApplication = (applicationResponse.successResponse?.application)!
        
        let userRegistration = UserRegistration(applicationId:verificationRequiredApplication.id)
        let user = User(email:"\(UUID()) + @example.com", password: "password")
        let registrationRequest = RegistrationRequest(registration: userRegistration, user:user)
        let registrationResponse = Register(client: tenantClient, request: registrationRequest)
        
        AssertSuccess(response: registrationResponse)
        
        let loginRequest = LoginRequest(applicationId:verificationRequiredApplication.id!, loginId: registrationResponse.successResponse?.user?.email!, password: "password")
        
        let loginResponse = Login(client: tenantClient, request: loginRequest)
        
        XCTAssertEqual(loginResponse.statusCode, 212)
        XCTAssertNotNil(loginResponse.successResponse)
        
        
        // Cleanup the verificationRequiredTenant, this will also delete the verificationRequiredApplication
        let deleteTenantResponse = DeleteTenant(tenantId: verificationRequiredTenant.id!)
        AssertSuccess(response: deleteTenantResponse)
        
    }
}
