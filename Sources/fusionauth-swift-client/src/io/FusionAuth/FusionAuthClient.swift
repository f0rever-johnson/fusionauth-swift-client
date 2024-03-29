//
//  FusionAuthClient.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation
import Network

/// Client that connects to a FusionAuth server and provides access to the full set of FusionAuth APIs.
/// All methods are Asynchonous
public class FusionAuthClient{

    private var jsonEncoder:JSONEncoder = JSONEncoder()
    private var fusionAuth:DefaultRESTClient
    
    public init(fusionAuth:DefaultRESTClient){
        self.fusionAuth = fusionAuth
        jsonEncoder.dateEncodingStrategy = .custom({ date, encoder in
            let milliseconds = Int(date.timeIntervalSince1970 * 1000)
            var singleValueEnc = encoder.singleValueContainer()
            try singleValueEnc.encode(milliseconds)
        })
    }

    /// Takes an action on a user. The user being actioned is called the "actionee" and the user taking the action is called the "actioner". Both user ids are required in the request object.
    /// - Parameters:
    ///   - request: The action request that includes all of the information about the action being taken including the id of the action, any options and the duration (if applicable).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ActionUser(request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Activates the FusionAuth Reactor using a license id and optionally a license text (for air-gapped deployments)
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - request: An optional request that contains the license text to activate Reactor (useful for air-gap deployments of FusionAuth)
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func ActivateReactor(request:ReactorRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/reactor"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }

    /// Adds a user to an existing family. The family id must be specified.
    /// - Parameters:
    ///   - familyId: The id of the family.
    ///   - request: The request object that contains all of the information used to determine which user to add to the family.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func AddUserToFamily(familyId:UUID?, request:FamilyRequest, clientResponse: @escaping( ClientResponse<FamilyResponse>) ->()) {

        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        }
    }

    /// Cancels the user action.
    /// - Parameters:
    ///   - actionId: The action id of the action to cancel.
    ///   - request: The action request that contains the information about the cancellation.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CancelAction(actionId:UUID, request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [actionId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Changes a user's password using the change password Id. This usually occurs after an email has been sent to the user and they clicked on a link to reset their password.
    /// As of version 1.32.2, prefer sending the changePasswordId in the request body. To do this, omit the first parameter, and set the value in the request body.
    /// - Parameters:
    ///   - changePasswordId: The change password Id used to find the user. This value is generated by FusionAuth once the change password workflow has been initiated.
    ///   - request: The change password request that contains all of the information used to change the password.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ChangePassword(changePasswordId:String, request:ChangePasswordRequest, clientResponse: @escaping(ClientResponse<ChangePasswordResponse>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [changePasswordId]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ChangePasswordResponse>) in
            clientResponse(response)
        })
    }

    /// Changes a user's password using their identity (login id and password). Using a loginId instead of the changePasswordId bypasses the email verification and allows a password to be changed directly without first calling the #forgotPassword method.
    /// - Parameters:
    ///   - request: The change password request that contains all of the information used to change the password.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ChangePasswordByIdentity(request:ChangePasswordRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Check to see if the user must obtain a Trust Token Id in order to complete a change password request.
    /// When a user has enabled Two-Factor authentication, before you are allowed to use the Change Password API to change
    /// your password, you must obtain a Truest Token by completing a Two-Factor Step-Up authentication.
    ///
    /// An HTTP status code of 412 indicates that a Trust Token is required to make a POST request to this API.
    /// - Parameters:
    ///   - changePasswordId: The change password Id used to find the user. This value is generated by FusionAuth once the change password workflow has been initiated.
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CheckChangePasswordUsingId(changePasswordId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let urlSegment:[String] = [changePasswordId]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Check to see if the user must obtain a Trust Token Id in order to complete a change password request.
    /// When a user has enabled Two-Factor authentication, before you are allowed to use the Change Password API to change
    /// your password, you must obtain a Truest Token by completing a Two-Factor Step-Up authentication.
    ///
    /// An HTTP status code of 412 indicates that a Trust Token is required to make a POST request to this API.
    /// - Parameters:
    ///   - encodedJWT: The encoded JWT (access token).
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CheckChangePasswordUsingJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let authorization:String = "Bearer " + encodedJWT
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization: authorization) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Check to see if the user must obtain a Trust Request Id in order to complete a change password request.
    /// When a user has enabled Two-Factor authentication, before you are allowed to use the Change Password API to change
    /// your password, you must obtain a Truest Request Id by completing a Two-Factor Step-Up authentication.
    ///
    /// An HTTP status code of 412 indicates that a Trust Token is required to make a POST request to this API.
    /// - Parameters:
    ///   - loginId: The loginId of the User that you intend to change the password for.
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CheckChangePasswordUsingLoginId(loginId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = ""
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "username", value: loginId)]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }

    /// Adds a comment to the user's account.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to create the user comment.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CommentOnUser(request:UserCommentRequest, clientResponse: @escaping(ClientResponse<UserCommentResponse>) -> ()){
        let urlPath:String = "/api/user/comment"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserCommentResponse>) in
            clientResponse(response)
        })
    }
    ///  Creates an API key. You can optionally specify a unique Id for the key, if not provided one will be generated.
    /// an API key can only be created with equal or lesser authority. An API key cannot create another API key unless it is granted
    /// to that API key.If an API key is locked to a tenant, it can only create API Keys for that same tenant.
    /// - Parameters:
    ///   - keyId: (Optional) The unique Id of the API key. If not provided a secure random Id will be generated.
    ///   - request: The request object that contains all of the information needed to create the APIKey.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateAPIKeys(keyId:UUID?, request:APIKeyRequest, clientResponse:@escaping(ClientResponse<APIKeyResponse>) -> ()){
        let urlPath:String = "/api/api-key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<APIKeyResponse>) in
            clientResponse(response)
        }
    }
    /// Creates an application. You can optionally specify an Id for the application, if not provided one will be generated.
    /// - Parameters:
    ///   - applicationId: (Optional) The Id to use for the application. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the application.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateApplication(applicationId:UUID?, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /// Creates a new role for an application. You must specify the id of the application you are creating the role for. You can optionally specify an Id for the role inside the ApplicationRole object itself, if not provided one will be generated.
    /// - Parameters:
    ///   - applicationId: The Id of the application to create the role on.
    ///   - roleId: (Optional) The Id of the role. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the application role.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateApplicationRole(applicationId:UUID, roleId:UUID?, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [applicationId.uuidString, "role", roleId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates an audit log with the message and user name (usually an email). Audit logs should be written anytime you make changes to the FusionAuth database. When using the FusionAuth App web interface, any changes are automatically written to the audit log. However, if you are accessing the API, you must write the audit logs yourself.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to create the audit log entry.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateAuditLog(request:AuditLogRequest, clientResponse: @escaping(ClientResponse<AuditLogResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<AuditLogResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a connector.  You can optionally specify an Id for the connector, if not provided one will be generated.
    /// - Parameters:
    ///   - connectorId: (Optional) The Id for the connector. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the connector.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateConnectorAsync(connectorId:UUID?, request:ConnectorRequest, clientResponse: @escaping(ClientResponse<ConnectorResponse>) -> ()){
        let urlPath:String = "/api/connector"
        let urlSegment:[String] = [connectorId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ConnectorResponse>) in
            clientResponse(response)
        }
    }

    /// Creates a user consent type. You can optionally specify an Id for the consent type, if not provided one will be generated.
    /// - Parameters:
    ///   - consentId: (Optional) The Id for the consent. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the consent.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public  func CreateConsent(consentId:UUID?, request:ConsentRequest, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }

    /// Creates an email template. You can optionally specify an Id for the template, if not provided one will be generated.
    /// - Parameters:
    ///   - emailTemplateId: (Optional) The Id for the template. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the email template.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateEmailTemplate(emailTemplateId:UUID?, request:EmailTemplateRequest, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }
    
    
    /// Creates an Entity. You can optionally specify an Id for the Entity. If not provided one will be generated.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityId:  (Optional) The Id for the Entity. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the Entity.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateEntity(entityId:UUID, request:EntityRequest, clientResponse:@escaping(ClientResponse<EntityResponse>) -> ()){
        let urlPath:String = "/api/entity"
        let urlSegment:[String] = [entityId.uuidString]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a Entity Type. You can optionally specify an Id for the Entity Type, if not provided one will be generated.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityTypeId:  (Optional) The Id for the Entity Type. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the Entity Type.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateEntityType(entityTypeId:UUID?, request:EntityTypeRequest, clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a new permission for an entity type. You must specify the id of the entity type you are creating the permission for.
    /// You can optionally specify an Id for the permission inside the EntityTypePermission object itself, if not provided one will be generated.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityTypeId: The Id of the entity type to create the permission on.
    ///   - permissionId: (Optional) The Id of the permission. If not provided a secure random UUID will be generated.
    ///   - request:  The request object that contains all of the information used to create the permission.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateEntityTypePermissions(entityTypeId:UUID?, permissionId:UUID?, request:EntityTypeRequest, clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? "", "permission", permissionId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }

    /// Creates a family with the user id in the request as the owner and sole member of the family. You can optionally specify an id for the family, if not provided one will be generated.
    /// - Parameters:
    ///   - familyId: (Optional) The id for the family. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the family.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateFamily(familyId:UUID?, request:FamilyRequest, clientResponse: @escaping(ClientResponse<FamilyResponse>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a form.  You can optionally specify an Id for the form, if not provided one will be generated.
    /// - Parameters:
    ///   - formId: (Optional) The Id for the form. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the form.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateForm(formId:UUID?, request:FormRequest, clientResponse:@escaping(ClientResponse<FormResponse>) -> ()){
        let urlPath:String = "/api/form"
        let urlSegment:[String] = [formId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data) { (response:ClientResponse<FormResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a form field.  You can optionally specify an Id for the form, if not provided one will be generated.
    /// - Parameters:
    ///   - fieldId: (Optional) The Id for the form field. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the form field.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateFormField(fieldId:UUID?, request:FormFieldRequest, clientResponse: @escaping(ClientResponse<FormFieldResponse>) -> ()){
        let urlPath:String = "/api/form/field"
        let urlSegment:[String] = [fieldId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data) { (response:ClientResponse<FormFieldResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a group. You can optionally specify an Id for the group, if not provided one will be generated.
    /// - Parameters:
    ///   - groupId: (Optional) The Id for the group. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the group.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateGroup(groupId:UUID?, request:GroupRequest, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }

    /// Creates a member in a group.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to create the group member(s).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateGroupMembers(request:MemberRequest, clientResponse: @escaping(ClientResponse<MemberResponse>) -> ()){
        let urlPath:String = "/api/group/member"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<MemberResponse>) in
            clientResponse(response)
        })
    }

    /// Creates an IP Access Control List. You can optionally specify an Id on this create request, if one is not provided one will be generated.
    /// - Parameters:
    ///   - accessControlListId: (Optional) The Id for the IP Access Control List. If not provided a secure random UUID will be generated.
    ///   - request: (Optional) The Id for the IP Access Control List. If not provided a secure random UUID will be generated.</param>
    /// <param name="request"> The request object that contains all of the information used to create the IP Access Control List.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateIPAccessControlList(accessControlListId:UUID?, request:IPAccessControlListRequest, clientResponse:@escaping(ClientResponse<IPAccessControlListResponse>) -> ()){
        let urlPath:String = "/api/ip-acl"
        let urlSegment:[String] = [accessControlListId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<IPAccessControlListResponse>) in
            clientResponse(response)
        }
    }

    /// Creates an identity provider. You can optionally specify an Id for the identity provider, if not provided one will be generated.
    /// - Parameters:
    ///   - identityProviderId: (Optional) The Id of the identity provider. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the identity provider.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateIdentityProvider(identityProviderId:UUID?, request:IdentityProviderRequest, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegments:[String] = [identityProviderId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })

    }
    
    /// Creates a Lambda. You can optionally specify an Id for the lambda, if not provided one will be generated.
    /// - Parameters:
    ///   - lambdaId: (Optional) The Id for the lambda. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the lambda.
    ///   - clientResponse: See returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateLambda(lambdaId:UUID?, request:LambdaRequest, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates an message template. You can optionally specify an Id for the template, if not provided one will be generated.
    /// - Parameters:
    ///   - messageTemplateId: (Optional) The Id for the template. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the message template.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateMessageTemplate(messageTemplateId:UUID?, request:MessageTemplateRequest, clientResponse:@escaping(ClientResponse<MessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template"
        let urlSegment:[String] = [messageTemplateId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessageTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a messenger.  You can optionally specify an Id for the messenger, if not provided one will be generated.
    /// - Parameters:
    ///   - messengerId: (Optional) The Id for the messenger. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the messenger.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateMessenger(messengerId:UUID?, request:MessengerRequest, clientResponse:@escaping(ClientResponse<MessengerResponse>) -> ()){
        let urlPath:String = "/api/messenger"
        let urlSegment:[String] = [messengerId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessengerResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a tenant. You can optionally specify an Id for the tenant, if not provided one will be generated.
    /// - Parameters:
    ///   - tenantId: (Optional) The Id for the tenant. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the tenant.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateTenant(tenantId:UUID?, request:TenantRequest, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [(tenantId?.uuidString) ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a Theme. You can optionally specify an Id for the theme, if not provided one will be generated.
    /// - Parameters:
    ///   - themeId: (Optional) The Id for the theme. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the theme.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateTheme(themeId:UUID?, request:ThemeRequest, clientResponse:@escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }

    /// Creates a user. You can optionally specify an Id for the user, if not provided one will be generated.
    /// - Parameters:
    ///   - userId: (Optional) The Id for the user. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or an other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateUser(userId:UUID?, request:UserRequest, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let data = try! jsonEncoder.encode(request)
        let urlSegments:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /// Creates a user action. This action cannot be taken on a user until this call successfully returns. Anytime after that the user action can be applied to any user.
    /// - Parameters:
    ///   - userActionId: (Optional) The Id for the user action. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the user action.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateUserAction(userActionId:UUID?, request:UserActionRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let data = try! jsonEncoder.encode(request)
        let urlSegments:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /// Creates a user reason. This user action reason cannot be used when actioning a user until this call completes successfully. Anytime after that the user action reason can be used.
    /// - Parameters:
    ///   - userActionReasonId: (Optional) The Id for the user action reason. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the user action reason.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateUserActionReason(userActionReasonId:UUID?, request:UserActionReasonRequest, clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let data = try! jsonEncoder.encode(request)
        let urlSegments:[String] = [userActionReasonId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a single User consent.
    /// - Parameters:
    ///   - userConsentId: (Optional) The Id for the User consent. If not provided a secure random UUID will be generated.
    ///   - request: The request that contains the user consent information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateUserConsent(userConsentId:UUID?, request:UserConsentRequest, clientResponse:@escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Link an external user from a 3rd party identity provider to a FusionAuth user.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to link the FusionAuth user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func CreateUserLink(request:IdentityProviderLinkRequest, clientResponse:@escaping(ClientResponse<IdentityProviderLinkResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/link"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<IdentityProviderLinkResponse>) in
            clientResponse(response)
        }
    }
    
    /// Creates a webhook. You can optionally specify an Id for the webhook, if not provided one will be generated.
    /// - Parameters:
    ///   - webhookId: (Optional) The Id for the webhook. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the webhook.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func CreateWebhook(webhookId:UUID?, request:WebhookRequest, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let data = try! jsonEncoder.encode(request)
        let urlSegments:[String] = [webhookId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST


        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }

    /// Deactivates the application with the given Id.
    /// - Parameters:
    ///   - applicationId: The Id of the application to deactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeactivateApplication(applicationId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegments:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deactivates the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user to deactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeactivateUser(userId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegments:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    ///  Deactivates the FusionAuth Reactor.
    /// This is an asynchronous method.
    /// - Parameter clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeactivateReactor(clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/reactor"
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Deactivates the user action with the given Id.
    /// - Parameters:
    ///   - userActionId: The Id of the user action to deactivate.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeactivateUserAction(userActionId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegments:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deactivates the users with the given ids.
    /// - Parameters:
    ///   - userIds: The ids of the users to deactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeactivateUsersById(userIds:[String], clientResponse: @escaping(ClientResponse<UserDeleteResponse>) -> ()){
        let urlPath:String = "/api/user/bulk"
        var urlParameter:[URLQueryItem]{
            var returnValue:[URLQueryItem] = [URLQueryItem]()
            for string in userIds{
                    let urlQueryItem = URLQueryItem(name: "userId", value: string)
                    returnValue.append(urlQueryItem)
                }
            returnValue.append(URLQueryItem(name: "dryRun", value: "false"))
            returnValue.append(URLQueryItem(name: "hardDelete", value: "false"))
            return returnValue
        }
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserDeleteResponse>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the API key for the given Id.
    /// - Parameters:
    ///   - keyId: The Id of the authentication API key to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteAPIKey(keyId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/api-key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Hard deletes an application. This is a dangerous operation and should not be used in most circumstances. This will delete the application, any registrations for that application, metrics and reports for the application, all the roles for the application, and any other data associated with the application. This operation could take a very long time, depending on the amount of data in your database.
    /// - Parameters:
    ///   - applicationId: The Id of the application to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteApplication(applicationId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "hardDelete", value: "true")]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod,urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Hard deletes an application role. This is a dangerous operation and should not be used in most circumstances. This permanently removes the given role from all users that had it.
    /// - Parameters:
    ///   - applicationId: "applicationId"> The Id of the application to deactivate.
    ///   - roleID: The Id of the role to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteApplicationRole(applicationId:UUID, roleID:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "role", roleID.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the connector for the given Id.
    /// - Parameters:
    ///   - connectorId: The Id of the connector to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteConnector(connectorId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/connector"
        let urlSegment:[String] = [connectorId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
        
    }

    /// Deletes the consent for the given Id.
    /// - Parameters:
    ///   - consentId: The Id of the consent to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteConsent(consentId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the email template for the given Id.
    /// - Parameters:
    ///   - emailTemplateId: The Id of the email template to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteEmailTemplate(emailTemplateId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the Entity for the given Id.
    /// - Parameters:
    ///   - entityId:  The Id of the Entity to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteEntity(entityId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity"
        let urlSegment:[String] = [entityId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    ///  Deletes an Entity Grant for the given User or Entity.
    /// - Parameters:
    ///   - entityId: The Id of the Entity that the Entity Grant is being deleted for.
    ///   - recipientEntityId: (Optional) The Id of the Entity that the Entity Grant is for.
    ///   - userId:  (Optional) The Id of the User that the Entity Grant is for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteEntityGrant(entityId:UUID?, recipientEntityId:UUID?, userId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "recipientEntityId", value: recipientEntityId?.uuidString ?? ""), URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let urlSegment:[String] = [entityId?.uuidString ?? "", "grant"]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Deletes the Entity Type for the given Id.
    /// - Parameters:
    ///   - entityTypeId:  The Id of the Entity Type to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteEntityType(entityTypeId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Hard deletes a permission. This is a dangerous operation and should not be used in most circumstances. This
    /// permanently removes the given permission from all grants that had it.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityTypeId: The Id of the entityType the the permission belongs to.
    ///   - permissionId: The Id of the permission to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteEntityTypePermissionsAsync(entityTypeId:UUID?, permissionId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? "", "permission", permissionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    /// Deletes the form for the given Id.
    /// - Parameters:
    ///   - formId: The Id of the form to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteForm(formId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/form"
        let urlSegment:[String] = [formId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Deletes the form field for the given Id.
    /// - Parameters:
    ///   - fieldId: The Id of the form field to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be anIOException.
    
    public func DeleteFormField(fieldId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/form/field"
        let urlSegment:[String] = [fieldId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Deletes the group for the given Id.
    /// - Parameters:
    ///   - groupId: The Id of the group to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteGroup(groupId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Removes users as members of a group.
    /// - Parameters:
    ///   - request: The member request that contains all of the information used to remove members to the group.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteGroupMembers(request:MemberDeleteRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/group/member"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the IP Access Control List for the given Id.
    /// - Parameters:
    ///   - ipAccessControlListId: The Id of the IP Access Control List to delete
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteIPAccessControlList(ipAccessControlListId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/ip-acl"
        let urlSegment:[String] = [ipAccessControlListId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }

    /// Deletes the identity provider for the given Id.
    /// - Parameters:
    ///   - identityProviderId: The Id of the identity provider to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteIdentityProvider(identityProviderId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })

    }

    /// Deletes the key for the given Id.
    /// - Parameters:
    ///   - keyId: The Id of the key to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteKey(keyId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the lambda for the given Id.
    /// - Parameters:
    ///   - lambdaId: The Id of the lambda to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteLambda(lambdaId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) ->()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    ///  Deletes the message template for the given Id.
    /// - Parameters:
    ///   - messageTemplateId:  The Id of the message template to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteMessageTemplate(messageTemplateId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/message/template"
        let urlSegment:[String] = [messageTemplateId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Deletes the messenger for the given Id.
    /// - Parameters:
    ///   - messengerId: The Id of the messenger to delete.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteMessenger(messengerId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/messenger"
        let urlSegment:[String] = [messengerId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    /// Deletes the user registration for the given user and application.
    /// - Parameters:
    ///   - userId: The Id of the user whose registration is being deleted.
    ///   - applicationId: The Id of the application to remove the registration for.
    ///   - clientResponse: see Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteRegistration(userId:UUID, applicationId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the user registration for the given user and application along with the given JSON body that contains the event information.
    /// - Parameters:
    ///   - userId: The Id of the user whose registration is being deleted.
    ///   - applicationId: The Id of the application to remove the registration for.
    ///   - request: The request body that contains the event information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteRegistrationWithRequest(userId:UUID, applicationId:UUID, request:RegistrationDeleteRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the tenant for the given Id.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteTenant(tenantId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the tenant for the given Id asynchronously. This method is helpful if you do not want to wait for the delete operation to complete.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteTenantAsync(tenantId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "async", value: "true")]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    ///  Deletes the tenant based on the given request (sent to the API as JSON). This permanently deletes all information, metrics, reports and data associated
    /// with the tenant and everything under the tenant (applications, users, etc).
    /// - Parameters:
    ///   - tenantId: The Id of the tenant to delete.
    ///   - request: The request object that contains all of the information used to delete the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteTenantWithRequest(tenantId:UUID, request:TenantDeleteRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the theme for the given Id.
    /// - Parameters:
    ///   - themeId: The Id of the theme to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteTheme(themeId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Remove an existing link that has been made from a 3rd party identity provider to a FusionAuth user.
    /// - Parameters:
    ///   - identityProviderId:  The unique Id of the identity provider.
    ///   - identityProviderUserId: The unique Id of the user in the 3rd party identity provider to unlink.
    ///   - userId: The unique Id of the FusionAuth user to unlink.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DeleteUserLink(identityProviderId:UUID?, identityProviderUserId:String, userId:UUID?, clientResponse:@escaping(ClientResponse<IdentityProviderLinkResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/link"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "identityProviderId", value: identityProviderId?.uuidString), URLQueryItem(name: "identityProviderUserId", value: identityProviderUserId), URLQueryItem(name: "userId", value: userId?.uuidString)]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath,  httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<IdentityProviderLinkResponse>) in
            clientResponse(response)
        }
    }
    
    /// Deletes the user for the given Id. This permanently deletes all information, metrics, reports and data associated with the user.
    /// - Parameters:
    ///   - userId: The Id of the user to delete.
    ///   - hardDelete: (Bool) Whether or not to hard delete user
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteUser(userId:UUID, hardDelete:Bool, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "hardDelete", value: String(hardDelete))]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    public func DeleteUserWithRequest(userId:UUID, request:UserDeleteSingleRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the user action for the given Id. This permanently deletes the user action and also any history and logs of the action being applied to any users.
    /// - Parameters:
    ///   - userActionId:  The Id of the user action to delete.
    ///   - clientResponse: Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteUserAction(userActionId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "hardDelete", value: "true")]
        let httpMethod:HTTPMethod = .DELETE


        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the user action reason for the given Id.
    /// - Parameters:
    ///   - userActionReasonId: The Id of the user action reason to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteUserActionReason(userActionReasonId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let urlSegment:[String] = [userActionReasonId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Deletes the users with the given ids, or users matching the provided JSON query or queryString. The order of preference is ids, query and then queryString, it is recommended to only provide one of the three for the request. This method can be used to deactivate or permanently delete (hard-delete) users based upon the hardDelete boolean in the request body. Using the dryRun parameter you may also request the result of the action without actually deleting or deactivating any users.
    /// - Parameters:
    ///   - request: The UserDeleteRequest.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteUsersByQuery(request:UserDeleteRequest, clientResponse: @escaping(ClientResponse<UserDeleteResponse>) -> ()){
        let urlPath:String = "/api/user/bulk"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<UserDeleteResponse>) in
            clientResponse(response)
        })
    }
    
    /// Deletes the webhook for the given Id.
    /// - Parameters:
    ///   - webhookId: The Id of the webhook to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DeleteWebhook(webhookId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Disable Two Factor authentication for a user.
    /// - Parameters:
    ///   - userId: The Id of the User for which you're disabling Two Factor authentication.
    ///   - code: The Two Factor code used verify the the caller knows the Two Factor secret.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func DisableTwoFactor(userId:UUID, methodId:String, code:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/two-factor"
        let urlSegment:[String] = [userId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "methodId", value: methodId), URLQueryItem(name: "code", value: code)]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Disable Two Factor authentication for a user using a JSON body rather than URL parameters.
    /// - Parameters:
    ///   - userId: The Id of the User for which you're disabling Two Factor authentication.
    ///   - request:  The request information that contains the code and methodId along with any event information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func DisableTwoFactorWithRequest(userId:UUID, request:TwoFactorDisableRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/two-factor"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Enable Two Factor authentication for a user.
    /// - Parameters:
    ///   - userId: The Id of the user to enable Two Factor authentication.
    ///   - request: The two factor enable request information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func EnableTwoFactor(userId:UUID, request:TwoFactorRequest, clientResponse: @escaping(ClientResponse<TwoFactorResponse>) -> ()){
        let urlPath:String = "/api/user/two-factor"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<TwoFactorResponse>) in
            clientResponse(response)
        })
    }
    
    /// Exchanges an OAuth authorization code for an access token. Makes a request to the Token endpoint to exchange the authorization code returned from the Authorize endpoint for an access token.
    /// - Parameters:
    ///   - code: The authorization code returned on the /oauth2/authorize response.
    ///   - clientId: The unique client identifier. The client Id is the Id of the FusionAuth Application in which you you are attempting to authenticate.
    ///   - clientSecret: (Optional) The client secret. This value will be required if client authentication is enabled.
    ///   - redirectUri: The URI to redirect to upon a successful request.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ExchangeOAuthCodeForAccessToken(code:String, clientId:String, clientSecret:String, redirectUri:String, clientResponse:@escaping(ClientResponse<AccessToken>) -> ()){
        let contentType:ContentType = .formURLEncoded
        let urlPath:String = "/oauth2/token"
        let parameters:[String:String] = ["code": code,
                                    "client_id": clientId,
                                    "client_secret": clientSecret,
                                    "grant_type": "authorization_code",
                                    "redirect_uri": redirectUri]
        guard let data:Data = parameters.percentEncoded() else{return}
        let httpMethod:HTTPMethod = .POST
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod:httpMethod, data:data, contentType:contentType) { (response:ClientResponse<AccessToken>) in
            clientResponse(response)
        }
    }

    /// Exchanges an OAuth authorization code and code_verifier for an access token. Makes a request to the Token endpoint to exchange the authorization code returned from the Authorize endpoint and a code_verifier for an access token.
    /// - Parameters:
    ///   - code: The authorization code returned on the /oauth2/authorize response.
    ///   - clientId: (Optional) The unique client identifier. The client Id is the Id of the FusionAuth Application in which you you are attempting to authenticate. This parameter is optional when the Authorization header is provided.
    ///   - clientSecret: (Optional) The client secret. This value may optionally be provided in the request body instead of the Authorization header.
    ///   - redirectUri: The URI to redirect to upon a successful request.
    ///   - codeVerifier: The random string generated previously. Will be compared with the code_challenge sent previously, which allows the OAuth provider to authenticate your app.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ExchangeOAuthCodeForAccessTokensUsingPKCE(code:String, clientId:String, clientSecret:String, redirectUri:String, codeVerifier:String, clientResponse:@escaping(ClientResponse<AccessToken>) -> ()){
        let contentType:ContentType = .formURLEncoded
        let urlPath:String = "/oauth2/token"
        let parameters:[String:String] = ["code":code,
                                          "client_id":clientId,
                                          "client_secret":clientSecret,
                                          "grant_type":"authorization_code",
                                          "redirect_uri":redirectUri,
                                          "code_verifier":codeVerifier]
        guard let data:Data = parameters.percentEncoded() else{return}
        let httpMethod:HTTPMethod = .POST
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod:httpMethod, data:data, contentType:contentType) { (response:ClientResponse<AccessToken>) in
            clientResponse(response)
        }
    }
    
    /// Exchange a Refresh Token for an Access Token. If you will be using the Refresh Token Grant, you will make a request to the Token endpoint to exchange the user’s refresh token for an access token.
    /// - Parameters:
    ///   - refreshToken: The refresh token that you would like to use to exchange for an access token.
    ///   - clientId: (Optional) The unique client identifier. The client Id is the Id of the FusionAuth Application in which you you are attempting to authenticate. This parameter is optional when the Authorization header is provided.
    ///   - clientSecret: (Optional) The client secret. This value may optionally be provided in the request body instead of the Authorization header.
    ///   - scope: (Optional) This parameter is optional and if omitted, the same scope requested during the authorization request will be used. If provided the scopes must match those requested during the initial authorization request.
    ///   - userCode: (Optional) The end-user verification code. This code is required if using this endpoint to approve the Device Authorization.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ExchangeRefreshTokenForAccessToken(refreshToken:String, clientId:String, clientSecret:String, scope:String, userCode:String, clientResponse:@escaping(ClientResponse<AccessToken>) -> ()){
        let contentType:ContentType = .formURLEncoded
        let urlPath:String = "/oauth2/token"
        let parameters:[String:String] = ["refresh_token":refreshToken,
                                          "client_id":clientId,
                                          "client_secret":clientSecret,
                                          "grant_type":"refresh_token",
                                          "scope":scope,
                                          "user_code":userCode]
        guard let data:Data = parameters.percentEncoded() else{return}
        let httpMethod:HTTPMethod = .POST
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod:httpMethod, data:data, contentType:contentType) { (response:ClientResponse<AccessToken>) in
            clientResponse(response)
        }
    }
    
    /// Exchange a refresh token for a new JWT.
    /// - Parameters:
    ///   - request: The refresh request.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ExchangeRefreshTokenForJWT(request:RefreshRequest, clientResponse: @escaping(ClientResponse<JWTRefreshResponse>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<JWTRefreshResponse>) in
            clientResponse(response)
        })
    }
    
    /// Exchange User Credentials for a Token. If you will be using the Resource Owner Password Credential Grant, you will make a request to the Token endpoint to exchange the user’s email and password for an access token.
    /// - Parameters:
    ///   - username: The login identifier of the user. The login identifier can be either the email or the username.
    ///   - password: The user’s password.
    ///   - clientId: (Optional) The unique client identifier. The client Id is the Id of the FusionAuth Application in which you you are attempting to authenticate. This parameter is optional when the Authorization header is provided.
    ///   - clientSecret: (Optional) The client secret. This value may optionally be provided in the request body instead of the Authorization header.
    ///   - scope: (Optional) This parameter is optional and if omitted, the same scope requested during the authorization request will be used. If provided the scopes must match those requested during the initial authorization request.
    ///   - userCode: (Optional) The end-user verification code. This code is required if using this endpoint to approve the Device Authorization.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ExchangeUserCredentialsForAccessToken(username:String, password:String, clientId:String, clientSecret:String, scope:String, userCode:String, clientResponse:@escaping(ClientResponse<AccessToken>) -> ()){
        let urlPath:String = "/oauth2/token"
        let parameters:[String:String] = ["username":username,
                                          "password":password,
                                          "client_id":clientId,
                                          "clientSecret":clientSecret,
                                          "grant_type":"password",
                                          "scope":scope,
                                          "user_Code":userCode]
        guard let data = parameters.percentEncoded() else{return}
        let contentType:ContentType = .formURLEncoded
        let httpMethod:HTTPMethod = .POST
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod:httpMethod, data:data, contentType:contentType) { (response:ClientResponse<AccessToken>) in
            clientResponse(response)
        }
    }

    /// Begins the forgot password sequence, which kicks off an email to the user so that they can reset their password.
    /// - Parameters:
    ///   - request: The request that contains the information about the user so that they can be emailed.
    ///   - clientResponse: See returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ForgotPassword(request:ForgotPasswordRequest, clientResponse: @escaping(ClientResponse<ForgotPasswordResponse>) -> ()){
        let urlPath:String = "/api/user/forgot-password"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ForgotPasswordResponse>) in
            clientResponse(response)
        })
    }
    
    /// Generate a new Email Verification Id to be used with the Verify Email API. This API will not attempt to send an email to the User. This API may be used to collect the verificationId for use with a third party system.
    /// - Parameters:
    ///   - email: The email address of the user that needs a new verification email.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func GenerateEmailVerificationId(email:String, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "sendVerifyPasswordEmail", value: "false")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }

    /// Generate a new RSA or EC key pair or an HMAC secret.
    /// - Parameters:
    ///   - keyId: (Optional) The Id for the key. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the key.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func GenerateKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key/generate"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Generate a new Application Registration Verification Id to be used with the Verify Registration API. This API will not attempt to send an email to the User. This API may be used to collect the verificationId for use with a third party system.
    /// - Parameters:
    ///   - email: The email address of the user that needs a new verification email.
    ///   - applicationId: The Id of the application to be verified.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func GenerateRegistrationVerificationId(email:String, applicationId:UUID, clientResponse: @escaping(ClientResponse<VerifyRegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "applicationId", value: applicationId.uuidString)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyRegistrationResponse>) in
            clientResponse(response)
        })
    }
    
    ///  Generate two-factor recovery codes for a user. Generating two-factor recovery codes will invalidate any existing recovery codes.
    /// - Parameters:
    ///   - userId: The Id of the user to generate new Two Factor recovery codes.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func GenerateTwoFactorRecoveryCodes(userId:UUID?, clientResponse:@escaping(ClientResponse<TwoFactorRecoveryCodeResponse>) -> ()){
        let urlPath:String = "/api/user/two-factor/recovery-code"
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<TwoFactorRecoveryCodeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Generate a Two Factor secret that can be used to enable Two Factor authentication for a User. The response will contain both the secret and a Base32 encoded form of the secret which can be shown to a User when using a 2 Step Authentication application such as Google Authenticator.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func GenerateTwoFactorSecret(clientResponse: @escaping(ClientResponse<SecretResponse>) -> ()){
        let urlPath:String = "/api/two-factor/secret"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<SecretResponse>) in
            clientResponse(response)
        })
    }

    /// Generate a Two Factor secret that can be used to enable Two Factor authentication for a User. The response will contain both the secret and a Base32 encoded form of the secret which can be shown to a User when using a 2 Step Authentication application such as Google Authenticator.
    /// - Parameters:
    ///   - encodedJWT: The encoded JWT (access token)
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func GenerateTwoFactorSecretUsingJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<SecretResponse>) -> ()){
        let urlPath:String = "/api/two-factor/secret"
        let authorization:String = ("JWT" + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization:authorization, fusionAuthClientResponse: { (response:ClientResponse<SecretResponse>) in
            clientResponse(response)
        })
    }

    /// Handles login via third-parties including Social login, external OAuth and OpenID Connect, and other login systems.
    /// - Parameters:
    ///   - request: The third-party login request that contains information from the third-party login providers that FusionAuth uses to reconcile the user's account.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func IdentityProviderLogin(request:IdentityProviderLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/login"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }

    /// Import an existing RSA or EC key pair or an HMAC secret.
    /// - Parameters:
    ///   - keyId: (Optional) The Id for the key. If not provided a secure random UUID will be generated.
    ///   - request: The request object that contains all of the information used to create the key.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ImportKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key/import"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Bulk imports refresh tokens. This request performs minimal validation and runs batch inserts of refresh tokens with the expectation that each token represents a user that already exists and is registered for the corresponding FusionAuth Application. This is done to increases the insert performance. Therefore, if you encounter an error due to a database key violation, the response will likely offer a generic explanation. If you encounter an error, you may optionally enable additional validation to receive a JSON response body with specific validation errors. This will slow the request down but will allow you to identify the cause of the failure. See the validateDbConstraints request parameter.
    /// - Parameters:
    ///   - request: The request that contains all of the information about all of the refresh tokens to import.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ImportRefreshTokens(request:RefreshTokenImportRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/refresh-token/import"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Bulk imports users. This request performs minimal validation and runs batch inserts of users with the expectation that each user does not yet exist and each registration corresponds to an existing FusionAuth Application. This is done to increases the insert performance. Therefore, if you encounter an error due to a database key violation, the response will likely offer a generic explanation. If you encounter an error, you may optionally enable additional validation to receive a JSON response body with specific validation errors. This will slow the request down but will allow you to identify the cause of the failure. See the validateDbConstraints request parameter.
    /// - Parameters:
    ///   - request: The request that contains all of the information about all of the users to import.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ImportUsers(request:ImportRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/import"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Inspect an access token issued by FusionAuth.
    /// - Parameters:
    ///   - clientId: The unique client identifier. The client Id is the Id of the FusionAuth Application for which this token was generated.
    ///   - token: The access token returned by this OAuth provider as the result of a successful authentication.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func IntrospectAccessTokenAsync(clientId:String, token:String, clientResponse:@escaping(ClientResponse<IntrospectResponse>) -> ()){
        let urlPath:String = "/oauth2/introspect"
        let parameters:[String:String] = ["client_id":clientId,
                                          "token":token]
        let contentType:ContentType = .formURLEncoded
        let httpMethod:HTTPMethod = .POST
        guard let data:Data = parameters.percentEncoded() else{return}
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod,data:data, contentType: contentType, fusionAuthClientResponse: { (response:ClientResponse<IntrospectResponse>) in
            clientResponse(response)
        })
    }
    
    /// Issue a new access token (JWT) for the requested Application after ensuring the provided JWT is valid. A valid access token is properly signed and not expired. This API may be used in an SSO configuration to issue new tokens for another application after the user has obtained a valid token from authentication.
    /// - Parameters:
    ///   - applicationId: The Application Id for which you are requesting a new access token be issued.
    ///   - encodedJWT: The encoded JWT (access token).
    ///   - refreshToken: (Optional) An existing refresh token used to request a refresh token in addition to a JWT in the response. The target application represented by the applicationId request parameter must have refresh tokens enabled in order to receive a refresh token in the response.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. AdditionallyFusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func IssueJWT(applicationId:UUID, encodedJWT:String, refreshToken:String, clientResponse: @escaping(ClientResponse<IssueResponse>) -> ()){
        let urlPath:String = "/api/jwt/issue"
        let authorization:String = ("JWT" + encodedJWT)
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId.uuidString), URLQueryItem(name: "refreshToken", value: refreshToken)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, authorization: authorization, fusionAuthClientResponse: { (response:ClientResponse<IssueResponse>) in
            clientResponse(response)
        })
    }

    /// Authenticates a user to FusionAuth. This API optionally requires an API key. See <code>Application.loginConfiguration.requireAuthentication</code>.
    /// - Parameters:
    ///   - request: The login request that contains the user credentials used to log them in.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func Login(request:LoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/login"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Sends a ping to FusionAuth indicating that the user was automatically logged into an application. When using FusionAuth's SSO or your own, you should call this if the user is already logged in centrally, but accesses an application where they no longer have a session. This helps correctly track login counts, times and helps with reporting.
    /// - Parameters:
    ///   - userId: The Id of the user that was logged in.
    ///   - applicationId: The Id of the application that they logged into.
    ///   - callerIPAddress: (Optional) The IP address of the end-user that is logging in. If a null value is provided the IP address will be that of the client or last proxy that sent the request.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func LoginPing(userId:UUID, applicationId:UUID, callerIPAddress:String?, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/login"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let urlParameter:[URLQueryItem] =  [URLQueryItem(name: "ipAddress", value: callerIPAddress)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Sends a ping to FusionAuth indicating that the user was automatically logged into an application. When using
    /// FusionAuth's SSO or your own, you should call this if the user is already logged in centrally, but accesses an
    /// application where they no longer have a session. This helps correctly track login counts, times and helps with
    /// reporting.
    /// - Parameters:
    ///   - request: The login request that contains the user credentials used to log them in
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func LoginPingWithRequest(request:LoginPingRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/login"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        }
    }
    
    /// The Logout API is intended to be used to remove the refresh token and access token cookies if they exist on the client and revoke the refresh token stored. This API does nothing if the request does not contain an access token or refresh token cookies.
    /// - Parameters:
    ///   - global: When this value is set to true all of the refresh tokens issued to the owner of the provided token will be revoked.
    ///   - refreshToken: (Optional) The refresh_token as a request parameter instead of coming in via a cookie. If provided this takes precedence over the cookie.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func Logout(global:Bool, refreshToken:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/logout"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "global", value: String(global)), URLQueryItem(name: "refreshToken", value: refreshToken)]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// The Logout API is intended to be used to remove the refresh token and access token cookies if they exist on the
    /// client and revoke the refresh token stored. This API takes the refresh token in the JSON body.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to logout the user
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func LogoutWithRequest(request:LogoutRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/logout"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /// Retrieves the identity provider for the given domain. A 200 response code indicates the domain is managed by a registered identity provider. A 404 indicates the domain is not managed.
    /// - Parameters:
    ///   - domain: The domain or email address to lookup.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    func LookupIdentityProvider(domain:String, clientResponse: @escaping(ClientResponse<LookupResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/lookup"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "domain", value: domain)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LookupResponse>) in
            clientResponse(response)
        })
    }
    
    /// Modifies a temporal user action by changing the expiration of the action and optionally adding a comment to the action.
    /// - Parameters:
    ///   - actionId: The Id of the action to modify. This is technically the user action log id.
    ///   - request: The request that contains all of the information about the modification.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ModifyAction(actionId:UUID, request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlSegment:[String] = [actionId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Complete a login request using a passwordless code
    /// - Parameters:
    ///   - request: The passwordless login request that contains all of the information used to complete login.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PasswordlessLogin(request:PasswordlessLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/passwordless/login"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates an authentication API key by given id
    /// - Parameters:
    ///   - keyId:  The Id of the authentication key. If not provided a secure random api key will be generated.
    ///   - request: The request object that contains all of the information needed to create the APIKey.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func PatchAPIkey(keyId:UUID?, request:APIKeyRequest, clientResponse:@escaping(ClientResponse<APIKeyResponse>) -> ()){
        let urlPath:String = "/api/api-key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<APIKeyResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the application with the given Id.
    /// - Parameters:
    ///   - applicationID: The Id of the application to update.
    ///   - request: The request that contains just the new application information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchApplication(applicationID:UUID?, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationID?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the application role with the given id for the application.
    /// - Parameters:
    ///   - applicationId: The Id of the application that the role belongs to.
    ///   - roleId: The Id of the role to update.
    ///   - request: The request that contains just the new role information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchApplicationRole(applicationId:UUID?, roleId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId?.uuidString ?? "", "role", roleId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        }
    }
    
    /// DescriptionUpdates, via PATCH, the connector with the given Id.
    /// - Parameters:
    ///   - connectorId: The Id of the connector to update.
    ///   - request: The request that contains just the new connector information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchConnector(connectorId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<ConnectorResponse>) -> ()){
        let urlPath:String = "/api/connector"
        let urlSegment:[String] = [connectorId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ConnectorResponse>) in
            clientResponse(response)
        }
    }
   
    /// Updates, via PATCH, the consent with the given Id.
    /// - Parameters:
    ///   - consentId: The Id of the consent to update.
    ///   - request: The request that contains just the new consent information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchConsent(consentId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the email template with the given Id.
    /// - Parameters:
    ///   - emailTemplateId: The Id of the email template to update.
    ///   - request: The request that contains just the new email template information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchEmailTemplate(emailTemplateId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the Entity Type with the given Id.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityTypeId: The Id of the Entity Type to update.
    ///   - request: The request that contains just the new Entity Type information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func PatchEntityType(entityTypeId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the group with the given Id
    /// - Parameters:
    ///   - groupId: The Id of the group to update.
    ///   - request: The request that contains just the new group information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchGroup(groupId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the identity provider with the given Id.
    /// - Parameters:
    ///   - identityProvider: The Id of the identity provider to update.
    ///   - request: The request object that contains just the updated identity provider information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchIdentityProvider(identityProvider:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProvider?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the available integrations
    /// - Parameters:
    ///   - request: The request that contains just the new integration information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchIntegrations(request:[String:JSONObject], clientResponse:@escaping(ClientResponse<IntegrationResponse>) -> ()){
        let urlPath:String = "/api/integration"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<IntegrationResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the lambda with the given Id.
    /// - Parameters:
    ///   - lambdaId: The Id of the lambda to update.
    ///   - request: The request that contains just the new lambda information.
    ///   - clientResponse: See returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchLambda(lambdaId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the message template with the given Id.
    /// - Parameters:
    ///   - messageTemplateId:  The Id of the message template to update.
    ///   - request: The request that contains just the new message template information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func PatchMessageTemplate(messageTemplateId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<MessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template"
        let urlSegment:[String] = [messageTemplateId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessageTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the messenger with the given Id.
    /// - Parameters:
    ///   - messengerId: The Id of the messenger to update.
    ///   - request: The request that contains just the new messenger information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func PatchMessenger(messengerId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<MessengerResponse>) -> ()){
        let urlPath:String = "/api/messenger"
        let urlSegment:[String] = [messengerId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessengerResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the registration for the user with the given id and the application defined in the request.
    /// - Parameters:
    ///   - userId: The Id of the user whose registration is going to be updated.
    ///   - request: The request that contains just the new registration information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchRegistration(userId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
    
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the system configuration.
    /// - Parameters:
    ///   - request: The request that contains just the new system configuration information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchSystemConfiguration(request:[String:JSONObject], clientResponse:@escaping(ClientResponse<SystemConfigurationResponse>) -> ()){
        let urlPath:String = "/api/system-configuration"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<SystemConfigurationResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the tenant with the given Id.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant to update.
    ///   - request: The request that contains just the new tenant information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchTenant(tenantId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<TenantResponse>) -> ()) {
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        }
    }

    /// Updates, via PATCH, the theme with the given Id.
    /// - Parameters:
    ///   - themeId: The Id of the theme to update.
    ///   - request: request descriptionThe request that contains just the new theme information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchTheme(themeId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user to update.
    ///   - request: The request that contains just the new user information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchUser(userId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        }
    }
   
    /// Updates, via PATCH, the user action with the given Id.
    /// - Parameters:
    ///   - userActionId: The Id of the user action to update.
    ///   - request: The request that contains just the new user action information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchUserAction(userActionId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, the user action reason with the given Id.
    /// - Parameters:
    ///   - userActionReasonId: The Id of the user action reason to update.
    ///   - request: The request that contains just the new user action reason information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchUserActionReason(userActionReasonId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let urlSegment:[String] = [userActionReasonId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates, via PATCH, a single User consent by Id.
    /// - Parameters:
    ///   - userConsentId: The User Consent Id
    ///   - request: The request that contains just the new user consent information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func PatchUserConsent(userConsentId:UUID?, request:[String:JSONObject], clientResponse:@escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PATCH
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        }
    }
    
    /// Reactivates the application with the given Id.
    /// - Parameters:
    ///   - applicationId: The Id of the application to reactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ReactivateApplication(applicationId:UUID, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Reactivates the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user to reactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ReactivateUser(userId:UUID, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Reactivates the user action with the given Id.
    /// - Parameters:
    ///   - userActionId: The Id of the user action to reactivate.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ReactivateUserAction(userActionId:UUID, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Reconcile a User to FusionAuth using JWT issued from another Identity Provider.
    /// - Parameters:
    ///   - request: The reconcile request that contains the data to reconcile the User.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ReconcileJWT(request:IdentityProviderLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/jwt/reconcile"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }
    
    ///  Request a refresh of the Entity search index. This API is not generally necessary and the search index will become consistent in a
    /// reasonable amount of time. There may be scenarios where you may wish to manually request an index refresh. One example may be
    /// if you are using the Search API or Delete Tenant API immediately following a Entity Create etc, you may wish to request a refresh to
    ///  ensure the index immediately current before making a query request to the search index.
    /// This is an asynchronous method.
    /// - Parameter clientResponse: See returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RefreshEntitySearchIndex(clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity/search"
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Request a refresh of the User search index. This API is not generally necessary and the search index will become consistent in a reasonable amount of time. There may be scenarios where you may wish to manually request an index refresh. One example may be if you are using the Search API or Delete Tenant API immediately following a User Create etc, you may wish to request a refresh to ensure the index immediately current before making a query request to the search index.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func RefreshUserSearchIndex(clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/search"
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Regenerates any keys that are used by the FusionAuth Reactor.
    /// This is an asynchronous method.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RegenerateReactorKeys(clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/reactor"
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Registers a user for an application. If you provide the User and the UserRegistration object on this request, it will create the user as well as register them for the application. This is called a Full Registration. However, if you only provide the UserRegistration object, then the user must already exist and they will be registered for the application. The user id can also be provided and it will either be used to look up an existing user or it will be used for the newly created User.
    /// - Parameters:
    ///   - userId: (Optional) The Id of the user being registered for the application and optionally created.
    ///   - request: The request that optionally contains the User and must contain the UserRegistration.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func Register(userId:UUID?, request:RegistrationRequest, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let data = try! jsonEncoder.encode(request)
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Requests Elasticsearch to delete and rebuild the index for FusionAuth users or entities. Be very careful when running this request as it will
    /// increase the CPU and I/O load on your database until the operation completes. Generally speaking you do not ever need to run this operation unless
    /// instructed by FusionAuth support, or if you are migrating a database another system and you are not brining along the Elasticsearch index.
    /// You have been warned.
    /// - Parameters:
    ///   - request: The request that contains the index name.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func Reindex(request:ReindexRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/system/reindex"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Removes a user from the family with the given id.
    /// - Parameters:
    ///   - familyId: The id of the family to remove the user from.
    ///   - userId: The id of the user to remove from the family.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func RemoveUserFromFamily(familyId:UUID?, userId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? "", userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Re-sends the verification email to the user.
    /// - Parameters:
    ///   - email: The email address of the user that needs a new verification email.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func ResendEmailVerification(email:String, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }
    
    /// Re-sends the verification email to the user. If the Application has configured a specific email template this will be used instead of the tenant configuration.
    /// - Parameters:
    ///   - applicationId: The unique Application Id to used to resolve an application specific email template.
    ///   - email: The email address of the user that needs a new verification email.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func ResendEmailVerificationWithApplicationTemplate(applicationId:UUID?, email:String, clientResponse:@escaping(ClientResponse<VerifyEmailResponse>)-> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? ""), URLQueryItem(name: "email", value: email)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }
    
    /// Re-sends the application registration verification email to the user.
    /// - Parameters:
    ///   - email: The email address of the user that needs a new verification email.
    ///   - applicationId: The Id of the application to be verified.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func ResendRegistrationVerification(email:String, applicationId:UUID?, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves an authentication API key for the given id
    /// - Parameters:
    ///   - keyId: The Id of the API key to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveAPIKey(keyId:UUID?, clientResponse:@escaping(ClientResponse<APIKeyResponse>) -> ()){
        let urlPath:String = "/api/api-key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<APIKeyResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves a single action log (the log of a user action that was taken on a user previously) for the given Id.
    /// - Parameters:
    ///   - actionId: The Id of the action to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    
    public func RetrieveAction(actionId:UUID, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlSegment:[String] = [actionId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the actions for the user with the given Id. This will return all time based actions that are active, and inactive as well as non-time based actions.
    /// - Parameters:
    ///   - userId: The Id of the user to fetch the actions for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveActions(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the actions for the user with the given Id that are currently preventing the User from logging in.
    /// - Parameters:
    ///   - userId: The Id of the user to fetch the actions for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.

    public func RetrieveActionsPreventingLogin(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "preventingLogin", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the actions for the user with the given Id that are currently active. An active action means one that is time based and has not been canceled, and has not ended.
    /// - Parameters:
    ///   - userId: The Id of the user to fetch the actions for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveActiveActions(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "active", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the application for the given id or all of the applications if the id is null.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveApplication(applicationId:UUID?, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the applications.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveApplications(clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves a single audit log for the given Id.
    /// - Parameters:
    ///   - auditLogId: The Id of the audit log to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveAuditLog(auditLogId:Int, clientResponse: @escaping(ClientResponse<AuditLogResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log"
        let urlSegment:[String] = [String(auditLogId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<AuditLogResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the connector with the given Id.
    /// - Parameters:
    ///   - connectorId: The Id of the connector.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveConnector(connectorId:UUID?, clientResponse:@escaping(ClientResponse<ConnectorResponse>) -> ()){
        let urlPath:String = "/api/connector"
        let urlSegment:[String] = [connectorId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<ConnectorResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves all of the connectors.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveConnectors(clientResponse:@escaping(ClientResponse<ConnectorResponse>) -> ()){
        let urlPath:String = "/api/connector"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<ConnectorResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the Consent for the given Id.
    /// - Parameters:
    ///   - consentId: The Id of the consent.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveConsent(consentId:UUID?, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the consent.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveConsents(clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the daily active user report between the two instants. If you specify an application id, it will only return the daily active counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - start: The start instant as UTC milliseconds since Epoch.
    ///   - end: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveDailyActiveReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<DailyActiveUserReportResponse>) -> ()){
        let urlPath:String = "/api/report/daily-active-user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "application", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<DailyActiveUserReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the email template for the given Id. If you don't specify the id, this will return all of the email templates.
    /// - Parameters:
    ///   - emailTemplateId: (Optional) The Id of the email template.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveEmailTemplate(emailTemplateId:UUID?, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a preview of the email template provided in the request. This allows you to preview an email template that hasn't been saved to the database yet. The entire email template does not need to be provided on the request. This will create the preview based on whatever is given.
    /// - Parameters:
    ///   - request: The request that contains the email template and optionally a locale to render it in.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveEmailTemplatePreview(request:PreviewRequest, clientResponse: @escaping(ClientResponse<PreviewResponse>) -> ()){
        let urlPath:String = "/api/email/template/preview"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<PreviewResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the email templates.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveEmailTemplates(clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the Entity for the given Id.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityId: The Id of the Entity.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveEntity(entityId:UUID?, clientResponse:@escaping(ClientResponse<EntityResponse>) -> ()){
        let urlPath:String = "/api/entity"
        let urlSegment:[String] = [entityId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<EntityResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves an Entity Grant for the given Entity and User/Entity.
    /// - Parameters:
    ///   - entityId: The Id of the Entity
    ///   - recipientEntityId: (Optional) The Id of the Entity that the Entity Grant is for.
    ///   - userId: (Optional) The Id of the User that the Entity Grant is for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveEntityGrant(entityId:UUID?, recipientEntityId:UUID?, userId:UUID?, clientResponse:@escaping(ClientResponse<EntityGrantResponse>) -> ()){
        let urlPath:String = "/api/entity"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "recipientEntityId", value: recipientEntityId?.uuidString ?? ""), URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let urlSegment:[String] = [entityId?.uuidString ?? "", "grant"]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<EntityGrantResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the Entity Type for the given Id.
    /// - Parameters:
    ///   - entityId: The Id of the Entity Type.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveEntityType(entityId:UUID?, clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves all of the Entity Types.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveEntityTypes(clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves a single event log for the given Id.
    /// - Parameters:
    ///   - eventLogId: The Id of the event log to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveEventLog(eventLogId:Int, clientResponse: @escaping(ClientResponse<EventLogResponse>) -> ()){
        let urlPath:String = "/api/system/event-log"
        let urlSegment:[String] = [String(eventLogId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EventLogResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the families that a user belongs to.
    /// - Parameters:
    ///   - userId: The User's id
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveFamilies(userId:UUID?, clientResponse: @escaping(ClientResponse<FamilyResponse>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the members of a family by the unique Family Id.
    /// - Parameters:
    ///   - familyId: The unique Id of the Family.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveFamilyMembersByFamilyId(familyId:UUID?, clientResponse:@escaping(ClientResponse<FamilyResponse>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the form with the given Id.
    /// - Parameters:
    ///   - formId: The Id of the form.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveForm(formId:UUID?, clientResponse:@escaping(ClientResponse<FormResponse>) -> ()){
        let urlPath:String = "/api/form"
        let urlSegment:[String] = [formId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<FormResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the forms.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveForms(clientResponse:@escaping(ClientResponse<FormResponse>) -> ()){
        let urlPath:String = "/api/form"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<FormResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the form field with the given Id.
    /// - Parameters:
    ///   - fieldId: The Id of the form field.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveFormField(fieldId:UUID?, clientResponse:@escaping(ClientResponse<FormFieldResponse>) -> ()){
        let urlPath:String = "/api/form/field"
        let urlSegment:[String] = [fieldId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<FormFieldResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the forms fields
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveFormFields(clientResponse:@escaping(ClientResponse<FormFieldResponse>) -> ()){
        let urlPath:String = "/api/form/field"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<FormFieldResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves the group for the given Id.
    /// - Parameters:
    ///   - groupId: The Id of the group.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveGroup(groupId:UUID, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves all of the groups.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveGroups(clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }


    /// Retrieves the IP Access Control List with the given Id.
    /// - Parameters:
    ///   - ipAccessControlListId: The Id of the IP Access Control List.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveIPAccessControlList(ipAccessControlListId:UUID?, clientResponse:@escaping(ClientResponse<IPAccessControlListResponse>) -> ()){
        let urlPath:String = "/api/ip-acl"
        let urlSegment:[String] = [ipAccessControlListId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<IPAccessControlListResponse>) in
            clientResponse(response)
        }
    }

    /// Retrieves the identity provider for the given id or all of the identity providers if the id is null.
    /// - Parameters:
    /// - identityProviderId: The identity provider id.
    /// - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveIdentityProvider(identityProviderId:UUID?, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves one or more identity provider for the given type. For types such as Google, Facebook, Twitter and LinkedIn, only a single
    /// identity provider can exist. For types such as OpenID Connect and SAMLv2 more than one identity provider can be configured so this request
    /// may return multiple identity providers. This is an asynchronous method.
    /// - Parameters:
    ///   - type: The type of the identity provider
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveIdentityProviderByTypeAsync(type:IdentityProviderType, clientResponse:@escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "type", value: type.rawValue)]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter) { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        }
    }
 
    /// Retrieves all of the identity providers.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveIdentityProviders(clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the actions for the user with the given Id that are currently inactive. An inactive action means one that is time based and has been canceled or has expired, or is not time based. This is an asynchronous method.
    /// - Parameters:
    /// - userId: The Id of the user to fetch the actions for.
    /// - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveInactiveActions(userId:UUID?, clientResponse:@escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "active", value: "false")]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter) { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves all of the applications that are currently inactive.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveInactiveApplications(clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "inactive", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the user actions that are currently inactive.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveInactiveUserActions(clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "inactive", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the available integrations.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveIntegrations(clientResponse: @escaping(ClientResponse<IntegrationResponse>) -> ()){
        let urlPath:String = "/api/integration"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IntegrationResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the Public Key configured for verifying JSON Web Tokens (JWT) by the key Id (kid).
    /// - Parameters:
    ///   - keyId: The Id of the public key (kid).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveJWTPublicKey(keyId:String, clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "kid", value: keyId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the Public Key configured for verifying the JSON Web Tokens (JWT) issued by the Login API by the Application Id.
    /// - Parameters:
    ///   - applicationId: The Id of the Application for which this key is used.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveJWTPublicKeyByApplicationId(applicationId:String, clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all Public Keys configured for verifying JSON Web Tokens (JWT).
    /// - Parameter clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveJWTPublicKeys(clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the key for the given Id.
    /// - Parameters:
    ///   - keyId: The Id of the key.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveKey(keyId:UUID?, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the keys.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveKeys(clientResponse: @escaping(ClientResponse<KeyResponse>) ->()){
        let urlPath:String = "/api/key"
        let httpMethod:HTTPMethod = .GET
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the lambda for the given Id.
    /// - Parameters:
    ///   - lambdaId: The Id of the lambda.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveLambda(lambdaId:UUID?, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the lambdas.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveLambdas(clientResponse: @escaping(ClientResponse<LambdaResponse>) ->()){
        let urlPath:String = "/api/lambda"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the lambdas for the provided type.
    /// - Parameters:
    ///   - type: The type of the lambda to return.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveLambdasByType(type:LambdaType, clientResponse: @escaping(ClientResponse<LambdaResponse>) ->()){
        let urlPath:String = "/api/lambda"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "type", value: type.rawValue)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the login report between the two instants. If you specify an application id, it will only return the login counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - start: The start instant as UTC milliseconds since Epoch.
    ///   - end: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveLoginReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/login"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the message template for the given Id. If you don't specify the id, this will return all of the message templates.
    /// - Parameters:
    ///   - messageTemplateId: (Optional) The Id of the message template.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveMessageTemplate(messageTemplateId:UUID?, clientResponse:@escaping(ClientResponse<MessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template"
        let urlSegment:[String] = [messageTemplateId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<MessageTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    ///  Retrieves all of the message templates.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveMessageTemplates(clientResponse:@escaping(ClientResponse<MessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<MessageTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    ///  Creates a preview of the message template provided in the request, normalized to a given locale.
    /// - Parameters:
    ///   - request: The request that contains the email template and optionally a locale to render it in.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveMessageTemplatePreview(request:PreviewMessageTemplateRequest, clientResponse:@escaping(ClientResponse<PreviewMessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template/preview"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<PreviewMessageTemplateResponse>) in
            clientResponse(response)
        }
    }

    ///  Retrieves the messenger with the given Id.
    /// - Parameters:
    ///   - messengerId: The Id of the messenger.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveMessenger(messengerId:UUID?, clientResponse:@escaping(ClientResponse<MessengerResponse>) -> ()){
        let urlPath:String = "/api/messenger"
        let urlSegment:[String] = [messengerId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<MessengerResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves all of the messengers.
    /// - Parameter clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveMessengers(clientResponse:@escaping(ClientResponse<MessengerResponse>) -> ()){
        let urlPath:String = "/api/messenger"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<MessengerResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the monthly active user report between the two instants. If you specify an application id, it will only return the monthly active counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - start: The start instant as UTC milliseconds since Epoch.
    ///   - end: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveMonthlyActiveReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<MonthlyActiveUserReportResponse>) -> ()){
        let urlPath:String = "/api/report/monthly-active-user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<MonthlyActiveUserReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the Oauth2 configuration for the application for the given Application Id.
    /// - Parameters:
    ///   - applicationId: The Id of the Application to retrieve OAuth configuration.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveOauthConfiguration(applicationId:UUID, clientResponse: @escaping(ClientResponse<OAuthConfigurationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "oauth-configuration"]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<OAuthConfigurationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Returns the well known OpenID Configuration JSON document
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveOpenIdConfigurations(clientResponse:@escaping(ClientResponse<OpenIdConfiguration>) -> ()){
        let urlPath:String = "/.well-known/openid-configuration"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<OpenIdConfiguration>) in
            clientResponse(response)
        }
    }

    /// Retrieves the password validation rules for a specific tenant. This method requires a tenantId to be provided through the use of a Tenant scoped API key or an HTTP header X-FusionAuth-TenantId to specify the Tenant Id. This API does not require an API key.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrievePasswordValidationRules(clientResponse: @escaping(ClientResponse<PasswordValidationRules>) -> ()){
        let urlPath:String = "/api/system-configuration/password-validation-rules"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PasswordValidationRules>) in
            clientResponse(response)
        })
    }

    /// Retrieves the password validation rules for a specific tenant.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrievePasswordValidationRulesWithTenantId(tenantId:UUID?, clientResponse: @escaping(ClientResponse<PasswordValidatonRulesResponse>) -> ()){
        let urlPath:String = "/api/tenant/password-validation-rules"
        let urlSegment:[String] = [tenantId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PasswordValidatonRulesResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the children for the given parent email address.
    /// - Parameters:
    ///   - parentEmail: The email of the parent.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrievePendingChildren(parentEmail:String, clientResponse: @escaping(ClientResponse<PendingResponse>) -> ()){
        let urlPath:String = "/api/user/family/pending"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "parentEmail", value: parentEmail)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<PendingResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the FusionAuth Reactor metrics.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveReactorMetrics(clientResponse:@escaping(ClientResponse<ReactorMetricsResponse>) -> ()){
        let urlPath:String = "/api/reactor/metrics"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<ReactorMetricsResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the FusionAuth Reactor status.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveReactorStatus(clientResponse:@escaping(ClientResponse<ReactorResponse>) -> ()){
        let urlPath:String = "/api/reactor"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<ReactorResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the last number of login records.
    /// - Parameters:
    ///   - offset: The initial record. e.g. 0 is the last login, 100 will be the 100th most recent login.
    ///   - limit: (Optional, defaults to 10) The number of records to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveRecentLogins(offset:Int, limit:Int = 10, clientResponse: @escaping(ClientResponse<RecentLoginResponse>) -> ()){
        let urlPath:String = "/api/user/recent-login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RecentLoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves a single refresh token by unique Id. This is not the same thing as the string value of the refresh token. If you have that, you already have what you need..
    /// - Parameters:
    ///   - userId:  The Id of the token.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveRefreshTokenById(userId:UUID, clientResponse:@escaping(ClientResponse<RefreshTokenResponse>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlSegment:[String] = [userId.uuidString]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RefreshTokenResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the refresh tokens that belong to the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveRefreshTokens(userId:UUID, clientResponse: @escaping(ClientResponse<RefreshTokenResponse>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId.uuidString)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RefreshTokenResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the user registration for the user with the given id and the given application id.
    /// - Parameters:
    ///   - userId: The Id of the user.
    ///   - applicationId: The Id of the application.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveRegistration(userId:UUID, applicationId:UUID, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }
    
    ///  Retrieves the registration report between the two instants. If you specify an application id, it will only return the registration counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - start: The start instant as UTC milliseconds since Epoch.
    ///   - end: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveRegistrationReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<RegistrationReportResponse>) -> ()){
        let urlPath:String = "/api/report/registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RegistrationReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieve the status of a re-index process. A status code of 200 indicates the re-index is in progress, a status code of
    /// 404 indicates no re-index is in progress.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveReindexStatus(clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/system/reindex"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the system configuration.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveSystemConfiguration(clientResponse: @escaping(ClientResponse<SystemConfigurationResponse>) -> ()){
        let urlPath:String = "/api/system-configuration"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<SystemConfigurationResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves the tenant for the given Id.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveTenant(tenantId:UUID, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the tenants.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveTenants(clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves the theme for the given Id.
    /// - Parameters:
    ///   - themeId: The Id of the theme.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveTheme(themeId:UUID?, clientResponse: @escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString  ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the themes.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveThemes(clientResponse: @escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }
    
    /// DescriptionRetrieves the totals report. This contains all of the total counts for each application and the global registration count.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveTotalReport(clientResponse: @escaping(ClientResponse<TotalsReportResponse>) -> ()){
        let urlPath:String = "/api/report/totals"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TotalsReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieve two-factor recovery codes for a user.
    /// - Parameters:
    ///   - userId: The Id of the user to retrieve Two Factor recovery codes.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveTwoFactorRecoveryCodes(userId:UUID?, clientResponse:@escaping(ClientResponse<TwoFactorRecoveryCodeResponse>) -> ()){
        let urlPath:String = "/api/user/two-factor/recovery-code"
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<TwoFactorRecoveryCodeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieve a user's two-factor status.
    ///
    /// This can be used to see if a user will need to complete a two-factor challenge to complete a login,
    /// and optionally identify the state of the two-factor trust across various applications.
    /// - Parameters:
    ///   - userId:  The user Id to retrieve the Two-Factor status.
    ///   - applicationId: The optional applicationId to verify.
    ///   - twoFactorTrustId: The optional two-factor trust Id to verify.
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveTwoFactorStatus(userId:UUID?, applicationId:UUID?, twoFactorTrustId:String, clientResponse:@escaping(ClientResponse<TwoFactorStatusResponse>) -> ()){
        let urlPath:String = "/api/two-factor/status"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name:"userId", value: userId?.uuidString), URLQueryItem(name: "applicationId", value: applicationId?.uuidString)]
        let urlSegment:[String] = [twoFactorTrustId]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameter) { (response:ClientResponse<TwoFactorStatusResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the user for the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUser(userId:UUID, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the user action for the given Id. If you pass in null for the id, this will return all of the user actions.
    /// - Parameters:
    ///   - userActionId: (Optional) The Id of the user action.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserAction(userActionId:UUID?, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the user action reason for the given Id. If you pass in null for the id, this will return all of the user action reasons.
    /// - Parameters:
    ///   - userActionReasonId: (Optional) The Id of the user action reason.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserActionReason(userActionReasonId:UUID?, clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let urlSegment:[String] = [userActionReasonId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all the user action reasons.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserActionReasons(clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves all of the user actions.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserActions(clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves the user by a change password Id. The intended use of this API is to retrieve a user after the forgot password workflow has been initiated and you may not know the user's email or username.
    /// - Parameters:
    ///   - changePasswordId: The unique change password Id that was sent via email or returned by the Forgot Password API.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserByChangePasswordId(changePasswordId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "changePasswordId", value: changePasswordId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the user for the given email.
    /// - Parameters:
    ///   - email: The email of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserByEmail(email:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "email", value: email)]

        fusionAuth.RESTClient(urlPath:urlPath, httpMethod: HTTPMethod.GET, urlParameters:urlParameter){(response:ClientResponse<UserResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the user for the loginId. The loginId can be either the username or the email.
    /// - Parameters:
    ///   - loginId: The email or username of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserByLoginId(loginId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "loginId", value: loginId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    
    /// Retrieves the user for the given username.
    /// - Parameters:
    ///   - username: The username of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserByUsername(username:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "username", value: username)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /// Retrieves the user by a verificationId. The intended use of this API is to retrieve a user after the forgot password workflow has been initiated and you may not know the user's email or username.
    /// - Parameters:
    ///   - verificationId: The unique verification Id that has been set on the user object.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserByVerificationId(verificationId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "verificationId", value: verificationId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the comments for the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserComments(userId:UUID, clientResponse: @escaping(ClientResponse<UserCommentResponse>) -> ()){
        let urlPath:String = "/api/user/comment"
        let urlSegment:[String] = [userId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserCommentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieve a single User consent by Id.
    /// - Parameters:
    ///   - userConsentId: The User consent Id
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserConsent(userConsentId:UUID?, clientResponse: @escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all of the consents for a User.
    /// - Parameters:
    ///   - userId: The User's Id
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserConsents(userId:UUID?, clientResponse: @escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlpath:String = "/api/user/consent"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlpath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Call the UserInfo endpoint to retrieve User Claims from the access token issued by FusionAuth.
    /// - Parameters:
    ///   - encodedJWT: The encoded JWT (access token).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserInfoFromAccessToken(encodedJWT:String, clientResponse:@escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "oauth2/userinfo"
        let authorization:String = ("Bearer " + encodedJWT)
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization:authorization) { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        }
        
    }
    
    /// Retrieve a single Identity Provider user (link).
    /// - Parameters:
    ///   - identityProviderId:  The unique Id of the identity provider
    ///   - identityProviderUserId: The unique Id of the user in the 3rd party identity provider.
    ///   - userId: The unique Id of the FusionAuth user
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveUserLink(identityProviderId:UUID?, identityProviderUserId:String, userId:UUID?, clientResponse:@escaping(ClientResponse<IdentityProviderLinkResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/link"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "identityProviderId", value: identityProviderId?.uuidString), URLQueryItem(name: "identityProviderUserId", value: identityProviderUserId), URLQueryItem(name: "userId", value: userId?.uuidString)]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<IdentityProviderLinkResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieve all Identity Provider users (links) for the user. Specify the optional identityProviderId to retrieve links for a particular IdP.
    /// - Parameters:
    ///   - identityProviderId: (Optional) The unique Id of the identity provider. Specify this value to reduce the links returned to those for a particular IdP.
    ///   - userId: The unique Id of the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveUserLinksByUserId(identityProviderId:UUID?, userId:UUID?, clientResponse:@escaping(ClientResponse<IdentityProviderLinkResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/link"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "identityProviderId", value: identityProviderId?.uuidString), URLQueryItem(name: "userId", value: userId?.uuidString)]
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<IdentityProviderLinkResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the login report between the two instants for a particular user by Id. If you specify an application id, it will only return the login counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - userId: The userId id.
    ///   - offset: The start instant as UTC milliseconds since Epoch.
    ///   - limit: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserLoginReport(applicationId:UUID?, userId:UUID, offset:Int, limit:Int, clientResponse: @escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/user-login"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId.uuidString), URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the login report between the two instants for a particular user by login Id. If you specify an application id, it will only return the login counts for that application.
    /// - Parameters:
    ///   - applicationId: (Optional) The application id.
    ///   - loginId: The userId id.
    ///   - start: The start instant as UTC milliseconds since Epoch.
    ///   - end: The end instant as UTC milliseconds since Epoch.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserLoginReportByLoginId(applicationId:UUID?, loginId:String, start:UInt64, end:UInt64, clientResponse:@escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? ""), URLQueryItem(name: "loginId", value: loginId), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the last number of login records for a user.
    /// - Parameters:
    ///   - userId: The Id of the user.
    ///   - offset: The initial record. e.g. 0 is the last login, 100 will be the 100th most recent login.
    ///   - limit: (Optional, defaults to 10) The number of records to retrieve.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserRecentLogins(userId:UUID, offset:Int, limit:Int = 10, clientResponse:@escaping(ClientResponse<RecentLoginResponse>) -> ()){
        let urlPath:String = "/api/user/recent-login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId.uuidString), URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RecentLoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the user for the given Id. This method does not use an API key, instead it uses a JSON Web Token (JWT) for authentication.
    /// - Parameters:
    ///   - encodedJWT: The encoded JWT (access token).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveUserUsingJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let authorization:String = ("JWT" + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization:authorization, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the FusionAuth version string.
    /// - Parameter clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RetrieveVersion(clientResponse:@escaping(ClientResponse<VersionResponse>) -> ()){
        let urlPath:String = "/api/system/version"
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod) { (response:ClientResponse<VersionResponse>) in
            clientResponse(response)
        }
    }
    
    /// Retrieves the webhook for the given Id. If you pass in null for the id, this will return all the webhooks.
    /// - Parameters:
    ///   - webhookId: (Optional) The Id of the webhook.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveWebhook(webhookId:UUID?, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves all the webhooks.
    /// - Parameter clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RetrieveWebhooks(clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }
    
    /// Revokes refresh tokens.
    ///
    /// Usage examples:
    ///   - Delete a single refresh token, pass in only the token.
    ///       revokeRefreshToken(token)
    ///
    ///   - Delete all refresh tokens for a user, pass in only the userId.
    ///       revokeRefreshToken(null, userId)
    ///
    ///   - Delete all refresh tokens for a user for a specific application, pass in both the userId and the applicationId.
    ///       revokeRefreshToken(null, userId, applicationId)
    ///
    ///   - Delete all refresh tokens for an application
    ///       revokeRefreshToken(null, null, applicationId)
    ///
    /// Note: <code>null</code> may be handled differently depending upon the programming language.
    ///
    /// See also: (method names may vary by language... but you'll figure it out)
    ///
    ///  - revokeRefreshTokenById
    ///  - revokeRefreshTokenByToken
    ///  - revokeRefreshTokensByUserId
    ///  - revokeRefreshTokensByApplicationId
    ///  - revokeRefreshTokensByUserIdForApplication
    /// - Parameters:
    ///   - token: (Optional) The refresh token to delete.
    ///   - userId: (Optional) The user id whose tokens to delete.
    ///   - applicationId: (Optional) The application id of the tokens to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RevokeRefreshToken(token:String, userId:UUID?, applicationId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "token", value: token), URLQueryItem(name: "userId", value: userId?.uuidString), URLQueryItem(name: "applicationId", value: applicationId?.uuidString)]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Revokes a single refresh token by the unique Id. The unique Id is not sensitive as it cannot be used to obtain another JWT.
    /// - Parameters:
    ///   - tokenId: The unique Id of the token to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRefreshTokenById(tokenId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlSegment:[String] = [tokenId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Revokes a single refresh token by using the actual refresh token value. This refresh token value is sensitive, so  be careful with this API request.
    /// - Parameters:
    ///   - token:  The refresh token to delete.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRereshTokenByToken(token:String, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "token", value: token)]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    /// Revoke all refresh tokens that belong to an application by applicationId.
    /// - Parameters:
    ///   - applicationId: The unique Id of the application that you want to delete all refresh tokens for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRefreshTokensByApplicationId(applicationId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Revoke all refresh tokens that belong to a user by user Id.
    /// - Parameters:
    ///   - userId: The unique Id of the user that you want to delete all refresh tokens for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRefreshTokensByUserId(userId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Revoke all refresh tokens that belong to a user by user Id for a specific application by applicationId.
    /// - Parameters:
    ///   - userId: The unique Id of the user that you want to delete all refresh tokens for.
    ///   - applicationId: The unique Id of the application that you want to delete refresh tokens for.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRefreshTokensByUserIdForApplication(userId:UUID?, applicationId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameters:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .DELETE
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }

    /// Revokes refresh tokens using the information in the JSON body. The handling for this method is the same as the revokeRefreshToken method
    /// and is based on the information you provide in the RefreshDeleteRequest object. See that method for additional information.
    /// - Parameters:
    ///   - request: The request information used to revoke the refresh tokens.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func RevokeRefreshTokensWithRequest(request:RefreshTokenRevokeRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }

    /// Revokes a single User consent by Id.
    /// - Parameters:
    ///   - userConsentId: The User Consent Id
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func RevokeUserConsent(userConsentId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Searches the audit logs with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SearchAuditLogs(request:AuditLogSearchRequest, clientResponse: @escaping(ClientResponse<LoginRecordSearchResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginRecordSearchResponse>) in
            clientResponse(response)
        })
    }
    
    /// Searches entities with the specified criteria and pagination.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchEntities(request:EntitySearchRequest, clientResponse:@escaping(ClientResponse<EntitySearchResponse>) -> ()){
        let urlPath:String = "/api/entity/search"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntitySearchResponse>) in
            clientResponse(response)
        }
    }
    
    ///  Retrieves the entities for the given ids. If any id is invalid, it is ignored.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - ids: The entity ids to search for.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchEntitiesByIds(ids:[String], clientResponse:@escaping(ClientResponse<EntitySearchResponse>) -> ()){
        let urlPath:String = "/api/entity/search"
        var urlParameters:[URLQueryItem] = []
        for id in ids{
            let queryItem = URLQueryItem(name: "ids", value: id)
            urlParameters.append(queryItem)
        }
        let httpMethod:HTTPMethod = .GET
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameters) { (response:ClientResponse<EntitySearchResponse>) in
            clientResponse(response)
        }
    }
    
    /// Searches Entity Grants with the specified criteria and pagination.
    /// - Parameters:
    ///   - request:  The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchEntityGrants(request:EntityGrantSearchRequest, clientResponse:@escaping(ClientResponse<EntityGrantSearchResponse>) -> ()){
        let urlPath:String = "/api/entity/grant/search"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityGrantSearchResponse>) in
            clientResponse(response)
        }
    }
    
    /// Searches the entity types with the specified criteria and pagination.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchEntityTypes(request:EntityTypeSearchRequest, clientResponse:@escaping(ClientResponse<EntityTypeSearchResponse>) -> ()){
        let urlPath:String = "/api/entity/type/search"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityTypeSearchResponse>) in
            clientResponse(response)
        }
    }
    
    /// Searches the event logs with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SearchEventLogs(request:EventLogSearchRequest, clientResponse:@escaping(ClientResponse<EventLogSearchResponse>) -> ()){
        let urlPath:String = "/api/system/event-log/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<EventLogSearchResponse>) in
            clientResponse(response)
        })
    }
    
    ///  Searches group members with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse:   See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchGroupMembers(request:GroupMemberSearchRequest, clientResponse:@escaping(ClientResponse<GroupMemberSearchResponse>) -> ()){
        let urlPath:String = "/api/group/member/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<GroupMemberSearchResponse>) in
            clientResponse(response)
        }
    }
    
    /// Searches groups with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchGroups(request:GroupSearchRequest, clientResponse:@escaping(ClientResponse<GroupSearchResponse>) -> ()){
        let urlPath:String = "/api/group/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<GroupSearchResponse>) in
            clientResponse(response)
        }
    }

    /// Searches the IP Access Control Lists with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SearchIPAccessControlLists(request:IPAccessControlListSearchRequest, clientResponse:@escaping(ClientResponse<IPAccessControlListSearchResponse>) -> ()){
        let urlPath:String = "/api/ip-acl/search"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<IPAccessControlListSearchResponse>) in
            clientResponse(response)
        }
    }

    /// Searches the login records with the specified criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SearchLoginRecords(request:LoginRecordSearchRequest, clientResponse:@escaping(ClientResponse<LoginRecordSearchResponse>) -> ()){
        let urlPath:String = "/api/system/login-record/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginRecordSearchResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the users for the given ids. If any id is invalid, it is ignored.
    /// - Parameters:
    ///   - ids: The user ids to search for
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SearchUsersByIds(ids:[UUID], clientResponse: @escaping(ClientResponse<SearchResponse>) -> ()){
        let urlPath:String = "/api/user/search"
        var urlParameter:[URLQueryItem]{
            var returnValue:[URLQueryItem] = [URLQueryItem]()
            for uuid in ids{
                let urlQueryItem = URLQueryItem(name: "ids", value: uuid.uuidString)
                returnValue.append(urlQueryItem)
            }
            return returnValue
        }
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<SearchResponse>) in
            clientResponse(response)
        })
    }
    
    /// Retrieves the users for the given search criteria and pagination.
    /// - Parameters:
    ///   - request: The search criteria and pagination constraints. Fields used: ids, query, queryString, numberOfResults, orderBy, startRow, and sortFields.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SearchUsersByQuery(request:SearchRequest, clientResponse: @escaping(ClientResponse<SearchResponse>) -> ()){
        let urlPath:String = "/api/user/search"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST


        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<SearchResponse>) in
            clientResponse(response)
        })

    }
    
    /// Send an email using an email template id. You can optionally provide <code>requestData</code> to access key value pairs in the email template.
    /// - Parameters:
    ///   - emailTemplateId: The id for the template.
    ///   - request: The send email request that contains all of the information used to send the email.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SendEmail(emailTemplateId:UUID, request:SendRequest, clientResponse: @escaping(ClientResponse<SendResponse>) -> ()){
        let urlPath:String = "/api/email/send"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<SendResponse>) in
            clientResponse(response)
        })
    }
    
    /// Sends out an email to a parent that they need to register and create a family or need to log in and add a child to their existing family.
    /// - Parameters:
    ///   - request: The request object that contains the parent email.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SendFamilyRequestEmail(request:FamilyEmailRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/family/request"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Send a passwordless authentication code in an email to complete login.
    /// - Parameters:
    ///   - request: The passwordless send request that contains all of the information used to send an email containing a code.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func SendPasswordlessCode(request:PasswordlessSendRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/passwordless/send"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Send a Two Factor authentication code to assist in setting up Two Factor authentication or disabling.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to send the code.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    @available(swift, obsoleted: 1.0, renamed: "SendTwoFactorCodeForEnableDisable")
    public func SendTwoFactorCode(request:TwoFactorSendRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    ///  Send a Two Factor authentication code to assist in setting up Two Factor authentication or disabling.
    /// - Parameters:
    ///   - request: The request object that contains all of the information used to send the code.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SendTwoFactorCodeForEnableDisable(request:TwoFactorSendRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Send a Two Factor authentication code to allow the completion of Two Factor authentication.
    /// - Parameters:
    ///   - twoFactorId: The Id returned by the Login API necessary to complete Two Factor authentication.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    @available(swift, obsoleted: 1.0, renamed: "SendTwoFactorCodeForLoginUsingMethod")
    public func SendTwoFactorCodeForLogin(twoFactorId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let urlSegment:[String] = [twoFactorId]
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Send a Two Factor authentication code to allow the completion of Two Factor authentication.
    /// - Parameters:
    ///   - twoFactorId: The Id returned by the Login API necessary to complete Two Factor authentication.
    ///   - request:  The Two Factor send request that contains all of the information used to send the Two Factor code to the user.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func SendTwoFactorCodeForLoginUsingMethod(twoFactorId:String, request:TwoFactorSendRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let urlSegment:[String] = [twoFactorId]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Begins a login request for a 3rd party login that requires user interaction such as HYPR.
    /// - Parameters:
    ///   - request: The third-party login request that contains information from the third-party login providers that FusionAuth uses to reconcile the user's account.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func StartIdentityProviderLogin(request:IdentityProviderStartLoginRequest, clientResponse:@escaping(ClientResponse<IdentityProviderStartLoginResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/start"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderStartLoginResponse>) in
            clientResponse(response)
        })
    }

    /// Start a passwordless login request by generating a passwordless code. This code can be sent to the User using the Send Passwordless Code API or using a mechanism outside of FusionAuth. The passwordless login is completed by using the Passwordless Login API with this code.
    /// - Parameters:
    ///   - request: The passwordless start request that contains all of the information used to begin the passwordless login request.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func StartPasswordlessLogin(request:PasswordlessStartRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/passwordless/start"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    /// Start a Two-Factor login request by generating a two-factor identifier. This code can then be sent to the Two Factor Send
    /// API (/api/two-factor/send)in order to send a one-time use code to a user. You can also use one-time use code returned
    /// to send the code out-of-band. The Two-Factor login is completed by making a request to the Two-Factor Login
    /// API (/api/two-factor/login). with the two-factor identifier and the one-time use code.
    /// This API is intended to allow you to begin a Two-Factor login outside of a normal login that originated from the Login API (/api/login).
    /// - Parameters:
    ///   - request:  The Two-Factor start request that contains all of the information used to begin the Two-Factor login request.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func StartTwoFactorLogin(request:TwoFactorStartRequest, clientResponse:@escaping(ClientResponse<TwoFactorStartResponse>) -> ()){
        let urlPath:String = "/api/two-factor/start"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<TwoFactorStartResponse>) in
            clientResponse(response)
        }
    }
    
    /// Complete login using a 2FA challenge
    /// - Parameters:
    ///   - request: The login request that contains the user credentials used to log them in.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func TwoFactorLogin(request:TwoFactorLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/two-factor/login"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates an API key by given id
    /// - Parameters:
    ///   - apiKeyId:  The Id of the API key to update.
    ///   - request:  The request object that contains all of the information used to create the API Key.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateAPIKey(apiKeyId:UUID?, request:APIKeyRequest, clientResponse:@escaping(ClientResponse<APIKeyResponse>) -> ()){
        let urlPath:String = "/api/api-key"
        let urlSegment:[String] = [apiKeyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<APIKeyResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the application with the given Id.
    /// - Parameters:
    ///   - applicationId: The Id of the application to update.
    ///   - request: The request that contains all of the new application information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateApplication(applicationId:UUID, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the application role with the given id for the application.
    /// - Parameters:
    ///   - applicationId: The Id of the application that the role belongs to.
    ///   - roleId: The Id of the role to update.
    ///   - request: The request that contains all of the new role information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateApplicationRole(applicationId:UUID, roleId:UUID, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "role", roleId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the connector with the given Id.
    /// - Parameters:
    ///   - connectorId: The Id of the connector to update.
    ///   - request: The request object that contains all of the new connector information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateConnector(connectorId:UUID?, request:ConnectorRequest, clientResponse:@escaping(ClientResponse<ConnectorResponse>) -> ()){
        let urlPath:String = "/api/connector"
        let urlSegment:[String] = [connectorId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpmethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpmethod, data:data) { (response:ClientResponse<ConnectorResponse>) in
            clientResponse(response)
        }
    }
    
    /// Description
    /// - Parameters:
    ///   - consentId: The Id of the consent to update.
    ///   - request: The request that contains all of the new consent information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateConsent(consentId:UUID?, request:ConsentRequest, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })

    }
    
    /// Updates the email template with the given Id.
    /// - Parameters:
    ///   - emailTemplateId: The Id of the email template to update.
    ///   - request: The request that contains all of the new email template information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateEmailTemplate(emailTemplateId:UUID, request:EmailTemplateRequest, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the Entity with the given Id.
    /// - Parameters:
    ///   - entityId: The Id of the Entity to update.
    ///   - request: The request that contains all of the new Entity information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateEntity(entityId:UUID?, request:EntityRequest, clientResponse:@escaping(ClientResponse<EntityResponse>) -> ()){
        let urlPath:String = "/api/entity"
        let urlSegment:[String] = [entityId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the Entity Type with the given Id.
    /// This is an asynchronous method.
    /// - Parameters:
    ///   - entityTypeId: The Id of the Entity Type to update.
    ///   - request: The request that contains all of the new Entity Type information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateEntityType(entityTypeId:UUID?, request:EntityTypeRequest, clientResponse:@escaping(ClientResponse<EntityTypeResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<EntityTypeResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the permission with the given id for the entity type.
    /// - Parameters:
    ///   - entityTypeId:  The Id of the entityType that the permission belongs to.
    ///   - permissionId: The Id of the permission to update.
    ///   - request: The request that contains all of the new permission information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateEntityTypePermission(entityTypeId:UUID?, permissionId:UUID?, request:EntityTypeRequest, clientResponse:@escaping(ClientResponse<EntityTypeSearchResponse>) -> ()){
        let urlPath:String = "/api/entity/type"
        let urlSegment:[String] = [entityTypeId?.uuidString ?? "", "permission", permissionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod) { (response:ClientResponse<EntityTypeSearchResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the form with the given Id.
    /// - Parameters:
    ///   - formId: The Id of the form to update.
    ///   - request: The request object that contains all of the new form information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateForm(formId:UUID?, request:FormRequest, clientResponse:@escaping(ClientResponse<FormResponse>) -> ()){
        let urlPath:String = "/api/form"
        let urlSegment:[String] = [formId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<FormResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the form field with the given Id.
    /// - Parameters:
    ///   - fieldId: The Id of the form field to update.
    ///   - request: The request object that contains all of the new form field information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateFormField(fieldId:UUID?, request:FormRequest, clientResponse:@escaping(ClientResponse<FormFieldResponse>) -> ()){
        let urlPath:String = "/api/form/field"
        let urlSegment:[String] = [fieldId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<FormFieldResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the group with the given Id.
    /// - Parameters:
    ///   - groupId: The Id of the group to update.
    ///   - request: The request that contains all of the new group information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateGroup(groupId:UUID, request:GroupRequest, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates a member in a group.
    /// - Parameters:
    ///   - request: The request object that contains all the information used to create the group member(s).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateGroupMembers(request:MemberRequest, clientResponse:@escaping(ClientResponse<MemberResponse>) -> ()){
        let urlPath:String = "/api/group/member"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<MemberResponse>) in
            clientResponse(response)
        })
        
    }

    /// Updates the IP Access Control List with the given Id.
    /// - Parameters:
    ///   - accessControlListId: The Id of the IP Access Control List to update.
    ///   - request: The request that contains all of the new IP Access Control List information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateIPAccessControlList(accessControlListId:UUID?, request:IPAccessControlListRequest, clientResponse:@escaping(ClientResponse<IPAccessControlListResponse>) -> ()){
        let urlPath:String = "/api/ip-acl"
        let urlSegment:[String] = [accessControlListId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<IPAccessControlListResponse>) in
            clientResponse(response)
        }
    }

    /// Updates the identity provider with the given Id.
    /// - Parameters:
    ///   - identityProviderId: The Id of the identity provider to update.
    ///   - request: The request object that contains the updated identity provider.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateIdentityProvider(identityProviderId:UUID, request:IdentityProviderRequest, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the available integrations.
    /// - Parameters:
    ///   - request: The request that contains all of the new integration information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateIntegrations(request:IntegrationRequest, clientResponse: @escaping(ClientResponse<IntegrationResponse>) -> ()){
        let urlPath:String = "/api/integration"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<IntegrationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the key with the given Id.
    /// - Parameters:
    ///   - keyId: The Id of the key to update.
    ///   - request: The request that contains all of the new key information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the lambda with the given Id.
    /// - Parameters:
    ///   - lambdaId: The Id of the lambda to update.
    ///   - request: The request that contains all of the new lambda information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateLambda(lambdaId:UUID?, request:LambdaRequest, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the message template with the given Id.
    /// - Parameters:
    ///   - messageTemplateId: The Id of the message template to update.
    ///   - request: The request that contains all of the new message template information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateMessageTemplate(messageTemplateId:UUID?, request:MessageTemplateRequest, clientResponse:@escaping(ClientResponse<MessageTemplateResponse>) -> ()){
        let urlPath:String = "/api/message/template"
        let urlSegment:[String] = [messageTemplateId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessageTemplateResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the messenger with the given Id.
    /// - Parameters:
    ///   - messengerId:  The Id of the messenger to update.
    ///   - request:  The request object that contains all of the new messenger information.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpdateMessenger(messengerId:UUID?, request:MessengerRequest, clientResponse:@escaping(ClientResponse<MessengerResponse>) -> ()){
        let urlPath:String = "/api/messenger"
        let urlSegment:[String] = [messengerId?.uuidString ?? ""]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<MessengerResponse>) in
            clientResponse(response)
        }
    }
    
    /// Updates the registration for the user with the given id and the application defined in the request.
    /// - Parameters:
    ///   - userId: The Id of the user whose registration is going to be updated.
    ///   - request: The request that contains all of the new registration information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateRegistration(userId:UUID, request:RegistrationRequest, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the system configuration.
    /// - Parameters:
    ///   - request: The request that contains all of the new system configuration information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateSystemConfiguration(request:SystemConfigurationRequest, clientResponse: @escaping(ClientResponse<SystemConfigurationResponse>) -> ()){
        let urlPath:String = "/api/system-configuration"
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<SystemConfigurationResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the tenant with the given Id.
    /// - Parameters:
    ///   - tenantId: The Id of the tenant to update.
    ///   - request: The request that contains all of the new tenant information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateTenant(tenantId:UUID, request:TenantRequest, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the theme with the given Id.
    /// - Parameters:
    ///   - themeId: The Id of the theme to update.
    ///   - request: The request that contains all of the new theme information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateTheme(themeId:UUID?, request:ThemeRequest, clientResponse: @escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the user with the given Id.
    /// - Parameters:
    ///   - userId: The Id of the user to update.
    ///   - request: The request that contains all of the new user information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateUser(userId:UUID, request:UserRequest, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the user action with the given Id.
    /// - Parameters:
    ///   - userActionId: The Id of the user action to update.
    ///   - request: The request that contains all of the new user action information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateUserAction(userActionId:UUID, request:UserActionRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })

    }
    
    /// Updates the user action reason with the given Id.
    /// - Parameters:
    ///   - userActionReasonId: The Id of the user action reason to update.
    ///   - request: The request that contains all of the new user action reason information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateUserActionReason(userActionReasonId:UUID, request:UserActionReasonRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionReasonId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates a single User consent by Id.
    /// - Parameters:
    ///   - userConsentId: The User Consent Id
    ///   - request: The request that contains the user consent information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateUserConsent(userConsentId:UUID?, request:UserConsentRequest, clientResponse:@escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }
    
    /// Updates the webhook with the given Id.
    /// - Parameters:
    ///   - webhookId: The Id of the webhook to update.
    ///   - request: The request that contains all of the new webhook information.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func UpdateWebhook(webhookId:UUID, request:WebhookRequest, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId.uuidString]
        let data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .PUT


        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }
    
    /// Creates or updates an Entity Grant. This is when a User/Entity is granted permissions to an Entity.
    /// - Parameters:
    ///   - entityId: The Id of the Entity that the User/Entity is being granted access to.
    ///   - request: The request object that contains all of the information used to create the Entity Grant.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func UpsertEntityGrant(entityId:UUID?, request:EntityGrantRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/entity"
        let urlSegment:[String] = [entityId?.uuidString ?? "", "grant"]
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Validates the end-user provided user_code from the user-interaction of the Device Authorization Grant. If you build your own activation form you should validate the user provided code prior to beginning the Authorization grant.
    /// - Parameters:
    ///   - userCode: The end-user verification code.
    ///   - clientId: The client id.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func ValidateDevice(userCode:String, clientId:String, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/oauth2/device/validate"
        let parameters:[String:String] = ["user_code":userCode,
                                          "client_id":clientId]
        guard let data = parameters.percentEncoded() else{return}
        let contentType:ContentType = .formURLEncoded
        let httpMethod:HTTPMethod = .GET
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod:httpMethod, data:data, contentType:contentType) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    ///  Validates the provided JWT (encoded JWT string) to ensure the token is valid. A valid access token is properly signed and not expired. This API may be used to verify the JWT as well as decode the encoded JWT into human readable identity claims.
    /// - Parameters:
    ///   - encodedJWT: The encoded JWT (access token).
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    public func ValidateJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<ValidateResponse>) -> ()){
        let urlPath:String = "/api/jwt/validate"
        let authorization:String = ("Bearer " + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization: authorization, fusionAuthClientResponse: { (response:ClientResponse<ValidateResponse>) in
            clientResponse(response)
        })
    }


    /// It's a JWT vending machine!
    ///
    /// Issue a new access token (JWT) with the provided claims in the request. This JWT is not scoped to a tenant or user, it is a free form
    /// token that will contain what claims you provide.
    /// <p>
    /// The iat, exp and jti claims will be added by FusionAuth, all other claims must be provided by the caller.
    ///
    /// If a TTL is not provided in the request, the TTL will be retrieved from the default Tenant or the Tenant specified on the request either
    /// by way of the X-FusionAuth-TenantId request header, or a tenant scoped API key.
    /// - Parameters:
    ///   - request: The request that contains all of the claims for this JWT.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func VendJWT(request:JWTVendRequest, clientResponse:@escaping(ClientResponse<JWTVendResponse>) -> ()){
        let urlPath:String = "/api/jwt/vend"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<JWTVendResponse>) in
            clientResponse(response)
        }
    }
    
    /// Confirms a email verification. The Id given is usually from an email sent to the user.
    /// - Parameters:
    ///   - verificationId: The email verification id sent to the user.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    @available(swift, obsoleted: 1.0, renamed: "VerifyEmailAddress")
    public func VerifyEmail(verificationId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlSegment:[String] = [verificationId]
        let httpMethod:HTTPMethod = .POST

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })

    }
    
    /// Confirms a user's email address.
    ///
    /// The request body will contain the verificationId. You may also be required to send a one-time use code based upon your configuration. When
    /// the tenant is configured to gate a user until their email address is verified, this procedures requires two values instead of one.
    /// The verificationId is a high entropy value and the one-time use code is a low entropy value that is easily entered in a user interactive form. The
    /// two values together are able to confirm a user's email address and mark the user's email address as verified.
    /// - Parameters:
    ///   - request: The request that contains the verificationId and optional one-time use code paired with the verificationId.
    ///   - clientResponse: See Returns
    /// - Returns:  When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func VerifyEmailAddress(request:VerifyEmailRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Administratively verify a user's email address. Use this method to bypass email verification for the user. The request body will contain the userId to be verified. An API key is required when sending the userId in the request body.
    /// - Parameters:
    ///   - request: The request that contains the userId to verify.
    ///   - clientResponse: See Returns
    /// - Returns:When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func VerifyEmailAddressByUserId(request:VerifyEmailRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = ""
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
    
    /// Confirms an application registration. The Id given is usually from an email sent to the user.
    /// - Parameters:
    ///   - verificationId: This is an asynchronous method.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an IOException.
    @available(swift, obsoleted: 1.0, renamed: "VerifyUserRegistrations")
    public func VerifyRegistration(verificationId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlSegment:[String] = [verificationId]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuth.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }
    
    ///  Confirms a user's registration.
    ///
    /// The request body will contain the verificationId. You may also be required to send a one-time use code based upon your configuration. When
    /// the application is configured to gate a user until their registration is verified, this procedures requires two values instead of one.
    /// The verificationId is a high entropy value and the one-time use code is a low entropy value that is easily entered in a user interactive form. The
    /// two values together are able to confirm a user's registration and mark the user's registration as verified.
    /// - Parameters:
    ///   - request: The request that contains the verificationId and optional one-time use code paired with the verificationId.
    ///   - clientResponse: See Returns
    /// - Returns: When successful, the response will contain the log of the action. If there was a validation error or any
    /// other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    /// contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    /// IOException.
    public func VerifyUserRegistration(request:VerifyRegistrationRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let data:Data = try! jsonEncoder.encode(request)
        let httpMethod:HTTPMethod = .POST
        
        fusionAuth.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data) { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        }
    }
}

