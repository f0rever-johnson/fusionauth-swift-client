//
//  FusionAuthSwiftClient.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Client that connects to a FusionAuth server and provides access to the full set of FusionAuth APIs.
 */

public class FusionAuthClient{

    private var fusionAuthRESTClient:DefaultRESTClient? = nil

    public init(baseUrl:String, port:Int = 9011, timeout:Int = 2000){
        fusionAuthRESTClient = DefaultRESTClient(baseUrl: baseUrl, port:port, timeout:timeout)
    }

    public init(apiKey:String, baseUrl:String, port:Int = 9011, timeout:Int = 2000) {
        fusionAuthRESTClient = DefaultRESTClient(apiKey: apiKey, baseUrl: baseUrl, port:port, timeout: timeout)
    }

    public init(apiKey:String, baseUrl:String, tenantId:String, port:Int = 9011, timeout:Int = 2000) {
        fusionAuthRESTClient = DefaultRESTClient(apiKey: apiKey, baseUrl: baseUrl, tenantId: tenantId, port: port, timeout: timeout)
    }



    /**
     * Takes an action on a user. The user being actioned is called the "actionee" and the user taking the action is called the
     * "actioner". Both user ids are required. You pass the actionee's user id into the method and the actioner's is put into the
     * request object.
     *
     * @param actioneeUserId The actionee's user id.
     * @param request The action request that includes all of the information about the action being taken including
     * the id of the action, any options and the duration (if applicable).
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ActionUser(actioneeUserId:UUID, request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlSegment:[String] = [actioneeUserId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })

    }

    /**
    * Adds a user to an existing family. The family id must be specified.
    *
    * @param familyId The id of the family.
    * @param request The request object that contains all of the information used to determine which user to add to the family.
    * @return When successful, the response will contain the log of the action. If there was a validation error or any
    * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    * IOException.
    */

    public func AddUserToFamily(familyId:UUID?, request:FamilyRequest, clientResponse: @escaping( ClientResponse<FamilyResponse>) ->()) {

        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data) { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        }
    }

    /**
     * Cancels the user action.
     *
     * @param actionId The action id of the action to cancel.
     * @param request The action request that contains the information about the cancellation.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CancelAction(actionId:UUID, request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Changes a user's password using their identity (login id and password). Using a loginId instead of the changePasswordId
     * bypasses the email verification and allows a password to be changed directly without first calling the #forgotPassword
     * method.
     *
     * @param request The change password request that contains all of the information used to change the password.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ChangePassword(changePasswordId:String, request:ChangePasswordRequest, clientResponse: @escaping(ClientResponse<ChangePasswordResponse>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let data = try! JSONEncoder().encode(request)
        let urlSegment:[String] = [changePasswordId]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ChangePasswordResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Changes a user's password using their identity (login id and password). Using a loginId instead of the changePasswordId
       * bypasses the email verification and allows a password to be changed directly without first calling the #forgotPassword
       * method.
       *
       * @param request The change password request that contains all of the information used to change the password.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func ChangePasswordByIdentity(request:ChangePasswordRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/change-password"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Adds a comment to the user's account.
     *
     * @param request The request object that contains all of the information used to create the user comment.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CommentOnUser(request:UserCommentRequest, clientResponse: @escaping(ClientResponse<UserCommentResponse>) -> ()){
        let urlPath:String = "/api/user/comment"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserCommentResponse>) in
            clientResponse(response)
        })

    }

    /**
     * Creates an application. You can optionally specify an Id for the application, if not provided one will be generated.
     *
     * @param applicationId (Optional) The Id to use for the application. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the application.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateApplication(applicationId:UUID?, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let data = try! JSONEncoder().encode(request)
        let urlSegment:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a new role for an application. You must specify the id of the application you are creating the role for.
     * You can optionally specify an Id for the role inside the ApplicationRole object itself, if not provided one will be generated.
     *
     * @param applicationId The Id of the application to create the role on.
     * @param roleId (Optional) The Id of the role. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the application role.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateApplicationRole(applicationId:UUID, roleId:UUID?, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let data = try! JSONEncoder().encode(request)
        let urlSegment:[String] = [applicationId.uuidString, "role", roleId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates an audit log with the message and user name (usually an email). Audit logs should be written anytime you
     * make changes to the FusionAuth database. When using the FusionAuth App web interface, any changes are automatically
     * written to the audit log. However, if you are accessing the API, you must write the audit logs yourself.
     *
     * @param request The request object that contains all of the information used to create the audit log entry.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateAuditLog(request:AuditLogRequest, clientResponse: @escaping(ClientResponse<AuditLogResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<AuditLogResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Creates a user consent type. You can optionally specify an Id for the consent type, if not provided one will be generated.
       *
       * @param consentId (Optional) The Id for the consent. If not provided a secure random UUID will be generated.
       * @param request The request object that contains all of the information used to create the consent.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public  func CreateConsent(consentId:UUID?, request:ConsentRequest, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates an email template. You can optionally specify an Id for the template, if not provided one will be generated.
     *
     * @param emailTemplateId (Optional) The Id for the template. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the email template.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateEmailTemplate(emailTemplateId:UUID?, request:EmailTemplateRequest, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }

    /**
    * Creates a family with the user id in the request as the owner and sole member of the family. You can optionally specify an id for the
    * family, if not provided one will be generated.
    *
    * @param familyId (Optional) The id for the family. If not provided a secure random UUID will be generated.
    * @param request The request object that contains all of the information used to create the family.
    * @return When successful, the response will contain the log of the action. If there was a validation error or any
    * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    * IOException.
    */

    public func CreateFamily(familyId:UUID?, request:FamilyRequest, clientResponse: @escaping(ClientResponse<FamilyResponse>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Creates a group. You can optionally specify an Id for the group, if not provided one will be generated.
     *
     * @param groupId (Optional) The Id for the group. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the group.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateGroup(groupId:UUID?, request:GroupRequest, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a member in a group.
     *
     * @param request The request object that contains all of the information used to create the group member(s).
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateGroupMembers(request:MemberRequest, clientResponse: @escaping(ClientResponse<MemberResponse>) -> ()){
        let urlPath:String = "/api/group/member"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST


        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<MemberResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates an identity provider. You can optionally specify an Id for the identity provider, if not provided one will be generated.
     *
     * @param identityProviderId (Optional) The Id of the identity provider. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the identity provider.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateIdentityProvider(identityProviderId:UUID?, request:IdentityProviderRequest, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegments:[String] = [identityProviderId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })

    }

    /**
       * Creates a Lambda. You can optionally specify an Id for the lambda, if not provided one will be generated.
       *
       * @param lambdaId (Optional) The Id for the lambda. If not provided a secure random UUID will be generated.
       * @param request The request object that contains all of the information used to create the lambda.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func CreateLambda(lambdaId:UUID?, request:LambdaRequest, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Creates a tenant. You can optionally specify an Id for the tenant, if not provided one will be generated.
     *
     * @param tenantId (Optional) The Id for the tenant. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the tenant.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateTenant(tenantId:UUID?, request:TenantRequest, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let data = try! JSONEncoder().encode(request)
        let urlSegment:[String] = [(tenantId?.uuidString) ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Creates a Theme. You can optionally specify an Id for the theme, if not provided one will be generated.
       *
       * @param themeId (Optional) The Id for the theme. If not provided a secure random UUID will be generated.
       * @param request The request object that contains all of the information used to create the theme.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func CreateTheme(themeId:UUID?, request:ThemeRequest, clientResponse:@escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a user. You can optionally specify an Id for the user, if not provided one will be generated.
     *
     * @param userId (Optional) The Id for the user. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateUser(userId:UUID?, request:UserRequest, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let data = try! JSONEncoder().encode(request)
        let urlSegments:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a user action. This action cannot be taken on a user until this call successfully returns. Anytime after
     * that the user action can be applied to any user.
     *
     * @param userActionId (Optional) The Id for the user action. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the user action.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateUserAction(userActionId:UUID?, request:UserActionRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let data = try! JSONEncoder().encode(request)
        let urlSegments:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a user reason. This user action reason cannot be used when actioning a user until this call completes
     * successfully. Anytime after that the user action reason can be used.
     *
     * @param userActionReasonId (Optional) The Id for the user action reason. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the user action reason.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateUserActionReason(userActionReasonId:UUID?, request:UserActionReasonRequest, clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let data = try! JSONEncoder().encode(request)
        let urlSegments:[String] = [userActionReasonId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Creates a single User consent.
       *
       * @param userConsentId (Optional) The Id for the User consent. If not provided a secure random UUID will be generated.
       * @param request The request that contains the user consent information.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func CreateUserConsent(userConsentId:UUID?, request:UserConsentRequest, clientResponse:@escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a webhook. You can optionally specify an Id for the webhook, if not provided one will be generated.
     *
     * @param webhookId (Optional) The Id for the webhook. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the webhook.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func CreateWebhook(webhookId:UUID?, request:WebhookRequest, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let data = try! JSONEncoder().encode(request)
        let urlSegments:[String] = [webhookId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST


        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Deactivates the application with the given Id.
     *
     * @param applicationId The Id of the application to deactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func DeactivateApplication(applicationId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegments:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deactivates the user with the given Id.
     *
     * @param userId The Id of the user to deactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeactivateUser(userId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegments:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deactivates the user action with the given Id.
     *
     * @param userActionId The Id of the user action to deactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeactivateUserAction(userActionId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegments:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegments, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deactivates the users with the given ids.
     *
     * @param userIds The ids of the users to deactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeactivateUsers(userIds:[String], clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/bulk"
        var urlParameter:[URLQueryItem]{
            var returnValue:[URLQueryItem] = [URLQueryItem]()
            for string in userIds{
                    let urlQueryItem = URLQueryItem(name: "userId", value: string)
                    returnValue.append(urlQueryItem)
                }
            return returnValue
        }
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Hard deletes an application. This is a dangerous operation and should not be used in most circumstances. This will
     * delete the application, any registrations for that application, metrics and reports for the application, all the
     * roles for the application, and any other data associated with the application. This operation could take a very
     * long time, depending on the amount of data in your database.
     *
     * @param applicationId The Id of the application to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteApplication(applicationId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "hardDelete", value: "true")]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod,urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Hard deletes an application role. This is a dangerous operation and should not be used in most circumstances. This
     * permanently removes the given role from all users that had it.
     *
     * @param applicationId The Id of the application to deactivate.
     * @param roleId The Id of the role to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteApplicationRole(applicationId:UUID, roleID:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "role", roleID.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
       * Deletes the consent for the given Id.
       *
       * @param consentId The Id of the consent to delete.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func DeleteConsent(consentId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the email template for the given Id.
     *
     * @param emailTemplateId The Id of the email template to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteEmailTemplate(emailTemplateId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the group for the given Id.
     *
     * @param groupId The Id of the group to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteGroup(groupId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Removes users as members of a group.
     *
     * @param request The member request that contains all of the information used to remove members to the group.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func DeleteGroupMembers(request:MemberDeleteRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/group/member"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the identity provider for the given Id.
     *
     * @param identityProviderId The Id of the identity provider to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteIdentityProvider(identityProviderId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })

    }

    /**
    * Deletes the key for the given Id.
    *
    * @param keyOd The Id of the key to delete.
    * @return When successful, the response will contain the log of the action. If there was a validation error or any
    * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    * IOException.
    */

    public func DeleteKey(keyId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the lambda for the given Id.
     *
     * @param lambdaId The Id of the lambda to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteLambda(lambdaId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) ->()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }




    /**
     * Deletes the user registration for the given user and application.
     *
     * @param userId The Id of the user whose registration is being deleted.
     * @param applicationId The Id of the application to remove the registration for.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteRegistration(userId:UUID, applicationId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the tenant for the given Id.
     *
     * @param tenantId The Id of the tenant to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteTenant(tenantId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
       * Deletes the theme for the given Id.
       *
       * @param themeId The Id of the theme to delete.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func DeleteTheme(themeId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }


    /**
     * Deletes the user for the given Id. This permanently deletes all information, metrics, reports and data associated
     * with the user.
     *
     * @param userId The Id of the user to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteUser(userId:UUID, hardDelete:Bool, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "hardDelete", value: String(hardDelete))]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the user action for the given Id. This permanently deletes the user action and also any history and logs of
     * the action being applied to any users.
     *
     * @param userActionId The Id of the user action to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteUserAction(userActionId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "hardDelete", value: "true")]
        let httpMethod:HTTPMethod = .DELETE


        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the user action reason for the given Id.
     *
     * @param userActionReasonId The Id of the user action reason to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteUserActionReason(userActionReasonId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let urlSegment:[String] = [userActionReasonId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the users with the given ids.
     *
     * @param request The ids of the users to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteUsers(request:UserDeleteRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/bulk"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Deletes the webhook for the given Id.
     *
     * @param webhookId The Id of the webhook to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func DeleteWebhook(webhookId:UUID, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId.uuidString]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Disable Two Factor authentication for a user.
     *
     * @param userId The Id of the User for which you're disabling Two Factor authentication.
     * @param code The Two Factor code used verify the the caller knows the Two Factor secret.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func DisableTwoFactor(userId:UUID, code:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/two-factor"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId.uuidString), URLQueryItem(name: "code", value: code)]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Enable Two Factor authentication for a user.
     *
     * @param userId The Id of the user to enable Two Factor authentication.
     * @param request The two factor enable request information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func EnableTwoFactor(userId:UUID, request:TwoFactorRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/two-factor"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Exchange a refresh token for a new JWT.
     *
     * @param request The refresh request.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ExchangeRefreshTokenForJWT(request:RefreshRequest, clientResponse: @escaping(ClientResponse<RefreshResponse>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RefreshResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Begins the forgot password sequence, which kicks off an email to the user so that they can reset their password.
     *
     * @param request The request that contains the information about the user so that they can be emailed.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func ForgotPassword(request:ForgotPasswordRequest, clientResponse: @escaping(ClientResponse<ForgotPasswordResponse>) -> ()){
        let urlPath:String = "/api/user/forgot-password"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ForgotPasswordResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Generate a new Email Verification Id to be used with the Verify Email API. This API will not attempt to send an
     * email to the User. This API may be used to collect the verificationId for use with a third party system.
     *
     * @param email The email address of the user that needs a new verification email.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func GenerateEmailVerificationId(email:String, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "sendVerifyPasswordEmail", value: "false")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Generate a new RSA or EC key pair or an HMAC secret.
       *
       * @param keyId (Optional) The Id for the key. If not provided a secure random UUID will be generated.
       * @param request The request object that contains all of the information used to create the key.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func GenerateKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key/generate"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Generate a new Application Registration Verification Id to be used with the Verify Registration API. This API will not attempt to send an
     * email to the User. This API may be used to collect the verificationId for use with a third party system.
     *
     * @param email The email address of the user that needs a new verification email.
     * @param applicationId The Id of the application to be verified.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func GenerateRegistrationVerificationId(email:String, applicationId:UUID, clientResponse: @escaping(ClientResponse<VerifyRegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "applicationId", value: applicationId.uuidString)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyRegistrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Generate a Two Factor secret that can be used to enable Two Factor authentication for a User. The response will contain
     * both the secret and a Base32 encoded form of the secret which can be shown to a User when using a 2 Step Authentication
     * application such as Google Authenticator.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func GenerateTwoFactorSecret(clientResponse: @escaping(ClientResponse<SecretResponse>) -> ()){
        let urlPath:String = "/api/two-factor/secret"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<SecretResponse>) in
            clientResponse(response)
        })



    }

    /**
     * Generate a Two Factor secret that can be used to enable Two Factor authentication for a User. The response will contain
     * both the secret and a Base32 encoded form of the secret which can be shown to a User when using a 2 Step Authentication
     * application such as Google Authenticator.
     *
     * @param encodedJWT The encoded JWT (access token).
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func GenerateTwoFactorSecretUsingJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<SecretResponse>) -> ()){
        let urlPath:String = "/api/two-factor/secret"
        let authorization:String = ("JWT" + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization:authorization, fusionAuthClientResponse: { (response:ClientResponse<SecretResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Handles login via third-parties including Social login, external OAuth and OpenID Connect, and other
     * login systems.
     *
     * @param request The third-party login request that contains information from the third-party login
     * providers that FusionAuth uses to reconcile the user's account.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func IdentityProviderLogin(request:IdentityProviderLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/login"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Import an existing RSA or EC key pair or an HMAC secret.
     *
     * @param keyId (Optional) The Id for the key. If not provided a secure random UUID will be generated.
     * @param request The request object that contains all of the information used to create the key.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ImportKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key/import"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Bulk imports multiple users. This does some validation, but then tries to run batch inserts of users. This reduces
     * latency when inserting lots of users. Therefore, the error response might contain some information about failures,
     * but it will likely be pretty generic.
     *
     * @param request The request that contains all of the information about all of the users to import.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ImportUsers(request:ImportRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/import"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Issue a new access token (JWT) for the requested Application after ensuring the provided JWT is valid. A valid
     * access token is properly signed and not expired.
     * <p>
     * This API may be used in an SSO configuration to issue new tokens for another application after the user has
     * obtained a valid token from authentication.
     *
     * @param applicationId The Application Id for which you are requesting a new access token be issued.
     * @param encodedJWT The encoded JWT (access token).
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func IssueJWT(applicationId:UUID, encodedJWT:String, clientResponse: @escaping(ClientResponse<IssueResponse>) -> ()){
        let urlPath:String = "/api/jwt/issue"
        let authorization:String = ("JWT" + encodedJWT)
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId.uuidString)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, authorization: authorization, fusionAuthClientResponse: { (response:ClientResponse<IssueResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Logs a user in.
     *
     * @param request The login request that contains the user credentials used to log them in.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func Login(request:LoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/login"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Sends a ping to FusionAuth indicating that the user was automatically logged into an application. When using
     * FusionAuth's SSO or your own, you should call this if the user is already logged in centrally, but accesses an
     * application where they no longer have a session. This helps correctly track login counts, times and helps with
     * reporting.
     *
     * @param userId The Id of the user that was logged in.
     * @param applicationId The Id of the application that they logged into.
     * @param callerIPAddress (Optional) The IP address of the end-user that is logging in. If a null value is provided
     * the IP address will be that of the client or last proxy that sent the request.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func LoginPing(userId:UUID, applicationId:UUID, callerIPAddress:String?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/login"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let urlParameter:[URLQueryItem] =  [URLQueryItem(name: "ipAddress", value: callerIPAddress)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * The Logout API is intended to be used to remove the refresh token and access token cookies if they exist on the
     * client and revoke the refresh token stored. This API does nothing if the request does not contain an access
     * token or refresh token cookies.
     *
     * @param global When this value is set to true all of the refresh tokens issued to the owner of the
     * provided token will be revoked.
     * @param refreshToken (Optional) The refresh_token as a request parameter instead of coming in via a cookie.
     * If provided this takes precedence over the cookie.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func Logout(global:Bool, refreshToken:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/logout"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "global", value: String(global)), URLQueryItem(name: "refreshToken", value: refreshToken)]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the identity provider for the given domain. A 200 response code indicates the domain is managed
     * by a registered identity provider. A 404 indicates the domain is not managed.
     *
     * @param domain The domain or email address to lookup.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    func LookupIdentityProvider(domain:String, clientResponse: @escaping(ClientResponse<LookupResponse>) -> ()){
        let urlPath:String = "/api/identity-provider/lookup"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "domain", value: domain)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LookupResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Modifies a temporal user action by changing the expiration of the action and optionally adding a comment to the
     * action.
     *
     * @param actionId The Id of the action to modify. This is technically the user action log id.
     * @param request The request that contains all of the information about the modification.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ModifyAction(actionId:UUID, request:ActionRequest, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlSegment:[String] = [actionId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Complete a login request using a passwordless code
     *
     * @param request The passwordless login request that contains all of the information used to complete login.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func PasswordlessLogin(request:PasswordlessLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/passwordless/login"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Reactivates the application with the given Id.
     *
     * @param applicationId The Id of the application to reactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ReactivateApplication(applicationId:UUID, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Reactivates the user with the given Id.
     *
     * @param userId The Id of the user to reactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ReactivateUser(userId:UUID, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Reactivates the user action with the given Id.
     *
     * @param userActionId The Id of the user action to reactivate.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ReactivateUserAction(userActionId:UUID, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "reactivate", value: "true")]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Reconcile a User to FusionAuth using JWT issued from another Identity Provider.
     *
     * @param request The reconcile request that contains the data to reconcile the User.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ReconcileJWT(request:IdentityProviderLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/jwt/reconcile"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Request a refresh of the User search index. This API is not generally necessary and the search index will become consistent in a
       * reasonable amount of time. There may be scenarios where you may wish to manually request an index refresh. One example may be
       * if you are using the Search API or Delete Tenant API immediately following a User Create etc, you may wish to request a refresh to
       *  ensure the index immediately current before making a query request to the search index.
       *
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RefreshUserSearchIndex(clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/search"
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Registers a user for an application. If you provide the User and the UserRegistration object on this request, it
     * will create the user as well as register them for the application. This is called a Full Registration. However, if
     * you only provide the UserRegistration object, then the user must already exist and they will be registered for the
     * application. The user id can also be provided and it will either be used to look up an existing user or it will be
     * used for the newly created User.
     *
     * @param userId (Optional) The Id of the user being registered for the application and optionally created.
     * @param request The request that optionally contains the User and must contain the UserRegistration.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func Register(userId:UUID?, request:RegistrationRequest, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let data = try! JSONEncoder().encode(request)
        let urlSegment:[String] = [userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments:urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Removes a user from the family with the given id.
     *
     * @param familyId The id of the family to remove the user from.
     * @param userId The id of the user to remove from the family.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RemoveUserFromFamily(familyId:UUID?, userId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/family"
        let urlSegment:[String] = [familyId?.uuidString ?? "", userId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Re-sends the verification email to the user.
     *
     * @param email The email address of the user that needs a new verification email.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ResendEmailVerification(email:String, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Re-sends the application registration verification email to the user.
     *
     * @param email The email address of the user that needs a new verification email.
     * @param applicationId The Id of the application to be verified.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ResendRegistrationVerification(email:String, applicationId:UUID, clientResponse: @escaping(ClientResponse<VerifyEmailResponse>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "email", value: email), URLQueryItem(name: "applicationId", value: applicationId.uuidString)]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<VerifyEmailResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves a single action log (the log of a user action that was taken on a user previously) for the given Id.
     *
     * @param actionId The Id of the action to retrieve.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveAction(actionId:UUID, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlSegment:[String] = [actionId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the actions for the user with the given Id.
     *
     * @param userId The Id of the user to fetch the actions for.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveActions(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the actions for the user with the given Id that are currently preventing the User from logging in.
       *
       * @param userId The Id of the user to fetch the actions for.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveActionsPreventingLogin(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "preventingLogin", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the actions for the user with the given Id that are currently active.
     * An active action means one that is time based and has not been canceled, and has not ended.
     *
     * @param userId The Id of the user to fetch the actions for.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveActiveActions(userId:UUID?, clientResponse: @escaping(ClientResponse<ActionResponse>) -> ()){
        let urlPath:String = "/api/user/action"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? ""), URLQueryItem(name: "active", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the application for the given id or all of the applications if the id is null.
     *
     * @param applicationId (Optional) The application id.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveApplication(applicationId:UUID?, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the applications.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveApplications(clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves a single audit log for the given Id.
     *
     * @param auditLogId The Id of the audit log to retrieve.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveAuditLog(auditLogId:Int, clientResponse: @escaping(ClientResponse<AuditLogResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log"
        let urlSegment:[String] = [String(auditLogId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<AuditLogResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the Consent for the given Id.
     *
     * @param consentId The Id of the consent.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveConsent(consentId:UUID?, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the consent.
       *
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveConsents(clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the daily active user report between the two instants. If you specify an application id, it will only
     * return the daily active counts for that application.
     *
     * @param applicationId (Optional) The application id.
     * @param start The start instant as UTC milliseconds since Epoch.
     * @param end The end instant as UTC milliseconds since Epoch.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveDailyActiveReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<DailyActiveUserReportResponse>) -> ()){
        let urlPath:String = "/api/report/daily-active-user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "application", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<DailyActiveUserReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the email template for the given Id. If you don't specify the id, this will return all of the email templates.
     *
     * @param emailTemplateId (Optional) The Id of the email template.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveEmailTemplate(emailTemplateId:UUID?, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Creates a preview of the email template provided in the request. This allows you to preview an email template that
     * hasn't been saved to the database yet. The entire email template does not need to be provided on the request. This
     * will create the preview based on whatever is given.
     *
     * @param request The request that contains the email template and optionally a locale to render it in.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveEmailTemplatePreview(request:PreviewRequest, clientResponse: @escaping(ClientResponse<PreviewResponse>) -> ()){
        let urlPath:String = "/api/email/template/preview"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<PreviewResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the email templates.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveEmailTemplates(clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves a single event log for the given Id.
       *
       * @param eventLogId The Id of the event log to retrieve.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveEventLog(eventLogId:Int, clientResponse: @escaping(ClientResponse<EventLogResponse>) -> ()){
        let urlPath = "/api/system/event-log"
        let urlSegment:[String] = [String(eventLogId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<EventLogResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the families that a user belongs to.
       *
       * @param userId The User's id
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveFamilies(userId:UUID?, clientResponse: @escaping(ClientResponse<FamilyResponse>) -> ()){
        let urlPath = "/api/user/family"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<FamilyResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the group for the given Id.
     *
     * @param groupId The Id of the group.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func RetrieveGroup(groupId:UUID, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the groups.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveGroups(clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Retrieves the identity provider for the given id or all of the identity providers if the id is null.
     *
     * @param identityProviderId (Optional) The identity provider id.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func RetrieveIdentityProvider(identityProviderId:UUID?, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the identity providers.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveIdentityProviders(clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the applications that are currently inactive.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveInactiveApplications(clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "inactive", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the user actions that are currently inactive.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveInactiveUserActions(clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "inactive", value: "true")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the available integrations.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveIntegration(clientResponse: @escaping(ClientResponse<IntegrationResponse>) -> ()){
        let urlPath:String = "/api/integration"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<IntegrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the Public Key configured for verifying JSON Web Tokens (JWT) by the key Id. If the key Id is provided a
     * single public key will be returned if one is found by that id. If the optional parameter key Id is not provided all
     * public keys will be returned.
     *
     * @param keyId (Optional) The Id of the public key.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveJWTPublicKey(keyId:String, clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let urlSegment:[String] = [keyId]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Retrieves the Public Key configured for verifying the JSON Web Tokens (JWT) issued by the Login API by the Application Id.
     *
     * @param applicationId The Id of the Application for which this key is used.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveJWTPublicKeyByApplicationId(applicationId:String, clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all Public Keys configured for verifying JSON Web Tokens (JWT).
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func RetrieveJWTPublicKeys(clientResponse: @escaping(ClientResponse<PublicKeyResponse>) -> ()){
        let urlPath:String = "/api/jwt/public-key"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PublicKeyResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves the key for the given Id.
       *
       * @param keyId The Id of the key.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveKey(keyId:UUID?, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the keys.
       *
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveKeys(clientResponse: @escaping(ClientResponse<KeyResponse>) ->()){
        let urlPath:String = "/api/key"
        let httpMethod:HTTPMethod = .GET
        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves the lambda for the given Id.
       *
       * @param lambdaId The Id of the lambda.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveLambda(lambdaId:UUID?, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the lambdas.
       *
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveLambdas(clientResponse: @escaping(ClientResponse<LambdaResponse>) ->()){
        let urlPath:String = "/api/lambda"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the lambdas for the provided type.
       *
       * @param type The type of the lambda to return.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveLambdasByType(type:LambdaType, clientResponse: @escaping(ClientResponse<LambdaResponse>) ->()){
        let urlPath:String = "/api/lambda"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "type", value: type.rawValue)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the login report between the two instants. If you specify an application id, it will only return the
     * login counts for that application.
     *
     * @param applicationId (Optional) The application id.
     * @param start The start instant as UTC milliseconds since Epoch.
     * @param end The end instant as UTC milliseconds since Epoch.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveLoginReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/login"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the monthly active user report between the two instants. If you specify an application id, it will only
     * return the monthly active counts for that application.
     *
     * @param applicationId (Optional) The application id.
     * @param start The start instant as UTC milliseconds since Epoch.
     * @param end The end instant as UTC milliseconds since Epoch.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveMonthlyActiveReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<MonthlyActiveUserReportResponse>) -> ()){
        let urlPath:String = "/api/report/monthly-active-user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<MonthlyActiveUserReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the Oauth2 configuration for the application for the given Application Id.
     *
     * @param applicationId The Id of the Application to retrieve OAuth configuration.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveOauthConfiguration(applicationId:UUID, clientResponse: @escaping(ClientResponse<OAuthConfigurationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "oauth-configuration"]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<OAuthConfigurationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the password validation rules.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrievePasswordValidationRules(clientResponse: @escaping(ClientResponse<PasswordValidationRules>) -> ()){
        let urlPath:String = "/api/system-configuration/password-validation-rules"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PasswordValidationRules>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the password validation rules for a specific tenant.
     *
     * This API does not require an API key.
     *
     * @param tenantId The Id of the tenant.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrievePasswordValidationRulesWithTenantId(tenantId:UUID?, clientResponse: @escaping(ClientResponse<PasswordValidatonRulesResponse>) -> ()){
        let urlPath:String = "/api/tenant/password-validation-rules"
        let urlSegment:[String] = [tenantId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<PasswordValidatonRulesResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves all of the children for the given parent email address.
       *
       * @param parentEmail The email of the parent.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrievePendingChildren(parentEmail:String, clientResponse: @escaping(ClientResponse<PendingResponse>) -> ()){
        let urlPath:String = "/api/user/family/pending"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "parentEmail", value: parentEmail)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<PendingResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the last number of login records.
     *
     * @param offset The initial record. e.g. 0 is the last login, 100 will be the 100th most recent login.
     * @param limit (Optional, defaults to 10) The number of records to retrieve.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveRecentLogins(offset:Int, limit:Int = 10, clientResponse: @escaping(ClientResponse<RecentLoginResponse>) -> ()){
        let urlPath:String = "/api/user/recent-login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RecentLoginResponse>) in
            clientResponse(response)
        })
    }


    /**
     * Retrieves the refresh tokens that belong to the user with the given Id.
     *
     * @param userId The Id of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveRefreshTokens(userId:UUID, clientResponse: @escaping(ClientResponse<RefreshResponse>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId.uuidString)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RefreshResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user registration for the user with the given id and the given application id.
     *
     * @param userId The Id of the user.
     * @param applicationId The Id of the application.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveRegistration(userId:UUID, applicationId:UUID, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString, applicationId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the registration report between the two instants. If you specify an application id, it will only return
     * the registration counts for that application.
     *
     * @param applicationId (Optional) The application id.
     * @param start The start instant as UTC milliseconds since Epoch.
     * @param end The end instant as UTC milliseconds since Epoch.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveRegistrationReport(applicationId:UUID?, start:Int, end:Int, clientResponse: @escaping(ClientResponse<RegistrationReportResponse>) -> ()){
        let urlPath:String = "/api/report/registration"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "applicationId", value: applicationId?.uuidString), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RegistrationReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the system configuration.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveSystemConfiguration(clientResponse: @escaping(ClientResponse<SystemConfigurationResponse>) -> ()){
        let urlPath:String = "/api/system-configuration"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<SystemConfigurationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the tenant for the given Id.
     *
     * @param tenantId The Id of the tenant.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveTenant(tenantId:UUID, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the tenants.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveTenants(clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieves the theme for the given Id.
       *
       * @param themeId The Id of the theme.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveTheme(themeId:UUID?, clientResponse: @escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString  ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the totals report. This contains all of the total counts for each application and the global registration
     * count.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveTotalReport(clientResponse: @escaping(ClientResponse<TotalsReportResponse>) -> ()){
        let urlPath:String = "/api/report/totals"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<TotalsReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user for the given Id.
     *
     * @param userId The Id of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUser(userId:UUID, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user action for the given Id. If you pass in null for the id, this will return all of the user
     * actions.
     *
     * @param userActionId (Optional) The Id of the user action.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserAction(userActionId:UUID?, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user action reason for the given Id. If you pass in null for the id, this will return all of the user
     * action reasons.
     *
     * @param userActionReasonId (Optional) The Id of the user action reason.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserActionReason(userActionReasonId:UUID?, clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let urlSegment:[String] = [userActionReasonId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all the user action reasons.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserActionReasons(clientResponse: @escaping(ClientResponse<UserActionReasonResponse>) -> ()){
        let urlPath:String = "/api/user-action-reason"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionReasonResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the user actions.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserActions(clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action-action"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user by a change password Id. The intended use of this API is to retrieve a user after the forgot
     * password workflow has been initiated and you may not know the user's email or username.
     *
     * @param changePasswordId The unique change password Id that was sent via email or returned by the Forgot Password API.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func RetrieveUserByChangePasswordId(changePasswordId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "changePasswordId", value: changePasswordId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user for the given email.
     *
     * @param email The email of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserByEmail(email:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "email", value: email)]

        fusionAuthRESTClient?.RESTClient(urlPath:urlPath, httpMethod: HTTPMethod.GET, urlParameters:urlParameter){(response:ClientResponse<UserResponse>) in
            clientResponse(response)
        }
    }

    /**
     * Retrieves the user for the loginId. The loginId can be either the username or the email.
     *
     * @param loginId The email or username of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserByLoginId(loginId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "loginId", value: loginId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user for the given username.
     *
     * @param username The username of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserByUsername(username:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "username", value: username)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the user by a verificationId. The intended use of this API is to retrieve a user after the forgot
     * password workflow has been initiated and you may not know the user's email or username.
     *
     * @param verificationId The unique verification Id that has been set on the user object.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserByVerificationId(verificationId:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "verificationId", value: verificationId)]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all of the comments for the user with the given Id.
     *
     * @param userId The Id of the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserComments(userId:UUID, clientResponse: @escaping(ClientResponse<UserCommentResponse>) -> ()){
        let urlPath:String = "/api/user/comment"
        let urlSegment:[String] = [userId.uuidString]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserCommentResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Retrieve a single User consent by Id.
       *
       * @param userConsentId The User consent Id
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func RetrieveUserConsent(userConsentId:UUID?, clientResponse: @escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }

    public func RetrieveUserConsents(userId:UUID?, clientResponse: @escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlpath:String = "/api/user/consent"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId?.uuidString ?? "")]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlpath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the last number of login records for a user.
     *
     * @param userId The Id of the user.
     * @param offset The initial record. e.g. 0 is the last login, 100 will be the 100th most recent login.
     * @param limit (Optional, defaults to 10) The number of records to retrieve.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserLoginReport(userId:UUID, offset:Int, limit:Int, clientResponse: @escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/user-login"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "userId", value: userId.uuidString), URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the login report between the two instants for a particular user by login Id. If you specify an application id, it will only return the
     * login counts for that application.
     *
     * @param applicationId (Optional) The application id.
     * @param loginId The userId id.
     * @param start The start instant as UTC milliseconds since Epoch.
     * @param end The end instant as UTC milliseconds since Epoch.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserLoginReportByLoginId(applicationId:UUID?, loginId:String, start:UInt64, end:UInt64, clientResponse:@escaping(ClientResponse<LoginReportResponse>) -> ()){
        let urlPath:String = "/api/report/login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "applicationId", value: applicationId?.uuidString ?? ""), URLQueryItem(name: "loginId", value: loginId), URLQueryItem(name: "start", value: String(start)), URLQueryItem(name: "end", value: String(end))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<LoginReportResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the last number of login records for a user.
     *
     * @param userId The Id of the user.
     * @param offset The initial record. e.g. 0 is the last login, 100 will be the 100th most recent login.
     * @param limit (Optional, defaults to 10) The number of records to retrieve.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveUserRecentLogins(userId:UUID, offset:Int, limit:Int = 10, clientResponse:@escaping(ClientResponse<RecentLoginResponse>) -> ()){
        let urlPath:String = "/api/user/recent-login"
        let urlParameter:[URLQueryItem] = [URLQueryItem(name: "userId", value: userId.uuidString), URLQueryItem(name: "offset", value: String(offset)), URLQueryItem(name: "limit", value: String(limit))]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RecentLoginResponse>) in
            clientResponse(response)
        })
    }

    /**
    * Retrieves the user for the given Id. This method does not use an API key, instead it uses a JSON Web Token (JWT) for authentication.
    *
    * @param encodedJWT The encoded JWT (access token).
    * @return When successful, the response will contain the log of the action. If there was a validation error or any
    * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    * IOException.
    */

    public func RetrieveUserUsingJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let authorization:String = ("JWT" + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization:authorization, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the webhook for the given Id. If you pass in null for the id, this will return all the webhooks.
     *
     * @param webhookId (Optional) The Id of the webhook.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RetrieveWebhook(webhookId:UUID?, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves all the webhooks.
     *
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func RetrieveWebhooks(clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Revokes a single refresh token, all tokens for a user or all tokens for an application. If you provide a user id
     * and an application id, this will delete all the refresh tokens for that user for that application.
     *
     * @param token (Optional) The refresh token to delete.
     * @param userId (Optional) The user id whose tokens to delete.
     * @param applicationId (Optional) The application id of the tokens to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func RevokeRefreshToken(token:String, userId:UUID?, applicationId:UUID?, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/jwt/refresh"
        let urlParameter:[URLQueryItem] =   [URLQueryItem(name: "token", value: token), URLQueryItem(name: "userId", value: userId?.uuidString), URLQueryItem(name: "applicationId", value: applicationId?.uuidString)]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters: urlParameter, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Revokes a single refresh token, all tokens for a user or all tokens for an application. If you provide a user id
     * and an application id, this will delete all the refresh tokens for that user for that application.
     *
     * @param token (Optional) The refresh token to delete.
     * @param userId (Optional) The user id whose tokens to delete.
     * @param applicationId (Optional) The application id of the tokens to delete.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */
    public func RevokeUserConsent(userConsentId:UUID?, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Searches the audit logs with the specified criteria and pagination.
     *
     * @param request The search criteria and pagination information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SearchAuditLogs(request:AuditLogSearchRequest, clientResponse: @escaping(ClientResponse<LoginRecordSearchResponse>) -> ()){
        let urlPath:String = "/api/system/audit-log/search"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginRecordSearchResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Searches the event logs with the specified criteria and pagination.
       *
       * @param request The search criteria and pagination information.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func SearchEventLogs(request:EventLogSearchRequest, clientResponse:@escaping(ClientResponse<EventLogSearchResponse>) -> ()){
        let urlPath:String = "/api/system/event-log/search"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<EventLogSearchResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Searches the login records with the specified criteria and pagination.
     *
     * @param request The search criteria and pagination information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SearchLoginRecords(request:LoginRecordSearchRequest, clientResponse:@escaping(ClientResponse<LoginRecordSearchResponse>) -> ()){
        let urlPath:String = "/api/system/login-record/search"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<LoginRecordSearchResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the users for the given ids. If any id is invalid, it is ignored.
     *
     * @param ids The user ids to search for.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SearchUsers(ids:[UUID], clientResponse: @escaping(ClientResponse<SearchResponse>) -> ()){
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

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, urlParameters:urlParameter, fusionAuthClientResponse: { (response:ClientResponse<SearchResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Retrieves the users for the given search criteria and pagination.
     *
     * @param request The search criteria and pagination constraints. Fields used: queryString, numberOfResults, startRow,
     * and sort fields.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SearchUsersByQueryString(request:SearchRequest, clientResponse: @escaping(ClientResponse<SearchResponse>) -> ()){
        let urlPath:String = "/api/user/search"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST


        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<SearchResponse>) in
            clientResponse(response)
        })

    }

    /**
     * Send an email using an email template id. You can optionally provide <code>requestData</code> to access key value
     * pairs in the email template.
     *
     * @param emailTemplateId The id for the template.
     * @param request The send email request that contains all of the information used to send the email.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SendEmail(emailTemplateId:UUID, request:SendRequest, clientResponse: @escaping(ClientResponse<SendResponse>) -> ()){
        let urlPath:String = "/api/email/send"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<SendResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Sends out an email to a parent that they need to register and create a family or need to log in and add a child to their existing family.
       *
       * @param request The request object that contains the parent email.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func SendFamilyRequestEmail(request:FamilyEmailRequest, clientResponse:@escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/family/request"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Send a passwordless authentication code in an email to complete login.
     *
     * @param request The passwordless send request that contains all of the information used to send an email containing a code.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SendPasswordlessCode(request:PasswordlessSendRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/passwordless/send"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })

    }

    /**
     * Send a Two Factor authentication code to assist in setting up Two Factor authentication or disabling.
     *
     * @param request The request object that contains all of the information used to send the code.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */


    public func SendTwoFactorCode(request:TwoFactorSendRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Send a Two Factor authentication code to allow the completion of Two Factor authentication.
     *
     * @param twoFactorId The Id returned by the Login API necessary to complete Two Factor authentication.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func SendTwoFactorCodeForLogin(twoFactorId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/two-factor/send"
        let urlSegment:[String] = [twoFactorId]
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
    * Start a passwordless login request by generating a passwordless code. This code can be sent to the User using the Send
    * Passwordless Code API or using a mechanism outside of FusionAuth. The passwordless login is completed by using the Passwordless Login API with this code.
    *
    * @param request The passwordless start request that contains all of the information used to begin the passwordless login request.
    * @return When successful, the response will contain the log of the action. If there was a validation error or any
    * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
    * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
    * IOException.
    */

    public func StartPasswordlessLogin(request:PasswordlessStartRequest, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/passwordless/start"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

    /**
     * Complete login using a 2FA challenge
     *
     * @param request The login request that contains the user credentials used to log them in.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func TwoFactorLogin(request:TwoFactorLoginRequest, clientResponse: @escaping(ClientResponse<LoginResponse>) -> ()){
        let urlPath:String = "/api/two-factor/login"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<LoginResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the application with the given Id.
     *
     * @param applicationId The Id of the application to update.
     * @param request The request that contains all of the new application information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateApplication(applicationId:UUID, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the application role with the given id for the application.
     *
     * @param applicationId The Id of the application that the role belongs to.
     * @param roleId The Id of the role to update.
     * @param request The request that contains all of the new role information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateApplicationRole(applicationId:UUID, roleId:UUID, request:ApplicationRequest, clientResponse: @escaping(ClientResponse<ApplicationResponse>) -> ()){
        let urlPath:String = "/api/application"
        let urlSegment:[String] = [applicationId.uuidString, "role", roleId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<ApplicationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the consent with the given Id.
     *
     * @param consentId The Id of the consent to update.
     * @param request The request that contains all of the new consent information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateConsent(consentId:UUID?, request:ConsentRequest, clientResponse: @escaping(ClientResponse<ConsentResponse>) -> ()){
        let urlPath:String = "/api/consent"
        let urlSegment:[String] = [consentId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ConsentResponse>) in
            clientResponse(response)
        })

    }

    /**
     * Updates the email template with the given Id.
     *
     * @param emailTemplateId The Id of the email template to update.
     * @param request The request that contains all of the new email template information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateEmailTemplate(emailTemplateId:UUID, request:EmailTemplateRequest, clientResponse: @escaping(ClientResponse<EmailTemplateResponse>) -> ()){
        let urlPath:String = "/api/email/template"
        let urlSegment:[String] = [emailTemplateId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<EmailTemplateResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the group with the given Id.
     *
     * @param groupId The Id of the group to update.
     * @param request The request that contains all of the new group information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateGroup(groupId:UUID, request:GroupRequest, clientResponse: @escaping(ClientResponse<GroupResponse>) -> ()){
        let urlPath:String = "/api/group"
        let urlSegment:[String] = [groupId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<GroupResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the identity provider with the given Id.
     *
     * @param identityProviderId The Id of the identity provider to update.
     * @param request The request object that contains the updated identity provider.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateIdentityProvider(identityProviderId:UUID, request:IdentityProviderRequest, clientResponse: @escaping(ClientResponse<IdentityProviderResponse>) -> ()){
        let urlPath:String = "/api/identity-provider"
        let urlSegment:[String] = [identityProviderId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<IdentityProviderResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the available integrations.
     *
     * @param request The request that contains all of the new integration information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateIntegrations(request:IntegrationRequest, clientResponse: @escaping(ClientResponse<IntegrationResponse>) -> ()){
        let urlPath:String = "/api/integration"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<IntegrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the key with the given Id.
     *
     * @param keyId The Id of the key to update.
     * @param request The request that contains all of the new key information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateKey(keyId:UUID?, request:KeyRequest, clientResponse: @escaping(ClientResponse<KeyResponse>) -> ()){
        let urlPath:String = "/api/key"
        let urlSegment:[String] = [keyId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<KeyResponse>) in
            clientResponse(response)
        })
    }

    /**
       * Updates the lambda with the given Id.
       *
       * @param lambdaId The Id of the lambda to update.
       * @param request The request that contains all of the new lambda information.
       * @return When successful, the response will contain the log of the action. If there was a validation error or any
       * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
       * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
       * IOException.
       */

    public func UpdateLambda(lambdaId:UUID?, request:LambdaRequest, clientResponse: @escaping(ClientResponse<LambdaResponse>) -> ()){
        let urlPath:String = "/api/lambda"
        let urlSegment:[String] = [lambdaId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<LambdaResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the registration for the user with the given id and the application defined in the request.
     *
     * @param userId The Id of the user whose registration is going to be updated.
     * @param request The request that contains all of the new registration information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateRegistrations(userId:UUID, request:RegistrationRequest, clientResponse: @escaping(ClientResponse<RegistrationResponse>) -> ()){
        let urlPath:String = "/api/user/registration"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<RegistrationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the system configuration.
     *
     * @param request The request that contains all of the new system configuration information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateSystemConfiguration(request:SystemConfigurationRequest, clientResponse: @escaping(ClientResponse<SystemConfigurationResponse>) -> ()){
        let urlPath:String = "/api/system-configuration"
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<SystemConfigurationResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the tenant with the given Id.
     *
     * @param tenantId The Id of the tenant to update.
     * @param request The request that contains all of the new tenant information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateTenant(tenantId:UUID, request:TenantRequest, clientResponse: @escaping(ClientResponse<TenantResponse>) -> ()){
        let urlPath:String = "/api/tenant"
        let urlSegment:[String] = [tenantId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<TenantResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the theme with the given Id.
     *
     * @param themeId The Id of the theme to update.
     * @param request The request that contains all of the new theme information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateTheme(themeId:UUID?, request:ThemeRequest, clientResponse: @escaping(ClientResponse<ThemeResponse>) -> ()){
        let urlPath:String = "/api/theme"
        let urlSegment:[String] = [themeId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<ThemeResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the user with the given Id.
     *
     * @param userId The Id of the user to update.
     * @param request The request that contains all of the new user information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateUser(userId:UUID, request:UserRequest, clientResponse: @escaping(ClientResponse<UserResponse>) -> ()){
        let urlPath:String = "/api/user"
        let urlSegment:[String] = [userId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the user action with the given Id.
     *
     * @param userActionId The Id of the user action to update.
     * @param request The request that contains all of the new user action information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateUserAction(userActionId:UUID, request:UserActionRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data:data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })

    }

    /**
     * Updates the user action reason with the given Id.
     *
     * @param userActionReasonId The Id of the user action reason to update.
     * @param request The request that contains all of the new user action reason information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateUserActionReason(userActionReasonId:UUID, request:UserActionReasonRequest, clientResponse: @escaping(ClientResponse<UserActionResponse>) -> ()){
        let urlPath:String = "/api/user-action"
        let urlSegment:[String] = [userActionReasonId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserActionResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates a single User consent by Id.
     *
     * @param userConsentId The User Consent Id
     * @param request The request that contains the user consent information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateUserConsent(userConsentId:UUID?, request:UserConsentRequest, clientResponse:@escaping(ClientResponse<UserConsentResponse>) -> ()){
        let urlPath:String = "/api/user/consent"
        let urlSegment:[String] = [userConsentId?.uuidString ?? ""]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<UserConsentResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Updates the webhook with the given Id.
     *
     * @param webhookId The Id of the webhook to update.
     * @param request The request that contains all of the new webhook information.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func UpdateWebhook(webhookId:UUID, request:WebhookRequest, clientResponse: @escaping(ClientResponse<WebhookResponse>) -> ()){
        let urlPath:String = "/api/webhook"
        let urlSegment:[String] = [webhookId.uuidString]
        let data = try! JSONEncoder().encode(request)
        let httpMethod:HTTPMethod = .PUT


        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, data: data, fusionAuthClientResponse: { (response:ClientResponse<WebhookResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Validates the provided JWT (encoded JWT string) to ensure the token is valid. A valid access token is properly
     * signed and not expired.
     * <p>
     * This API may be used to verify the JWT as well as decode the encoded JWT into human readable identity claims.
     *
     * @param encodedJWT The encoded JWT (access token).
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func ValidateJWT(encodedJWT:String, clientResponse: @escaping(ClientResponse<ValidateResponse>) -> ()){
        let urlPath:String = "/api/jwt/validate"
        let authorization:String = ("JWT" + encodedJWT)
        let httpMethod:HTTPMethod = .GET

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, httpMethod: httpMethod, authorization: authorization, fusionAuthClientResponse: { (response:ClientResponse<ValidateResponse>) in
            clientResponse(response)
        })
    }

    /**
     * Confirms a email verification. The Id given is usually from an email sent to the user.
     *
     * @param verificationId The email verification id sent to the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func VerifyEmail(verificationId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-email"
        let urlSegment:[String] = [verificationId]
        let httpMethod:HTTPMethod = .POST

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })

    }

    /**
     * Confirms an application registration. The Id given is usually from an email sent to the user.
     *
     * @param verificationId The registration verification Id sent to the user.
     * @return When successful, the response will contain the log of the action. If there was a validation error or any
     * other type of error, this will return the Errors object in the response. Additionally, if FusionAuth could not be
     * contacted because it is down or experiencing a failure, the response will contain an Exception, which could be an
     * IOException.
     */

    public func VerifyRegistration(verificationId:String, clientResponse: @escaping(ClientResponse<RESTVoid>) -> ()){
        let urlPath:String = "/api/user/verify-registration"
        let urlSegment:[String] = [verificationId]
        let httpMethod:HTTPMethod = .DELETE

        fusionAuthRESTClient?.RESTClient(urlPath: urlPath, urlSegments: urlSegment, httpMethod: httpMethod, fusionAuthClientResponse: { (response:ClientResponse<RESTVoid>) in
            clientResponse(response)
        })
    }

}

