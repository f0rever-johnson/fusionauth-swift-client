//
//  Example.swift
//  
//
//  Created by Everaldlee Johnson on 2/4/21.
//

import Foundation
import fusionauth_swift_client

public class Example{
    
    //Insert own apiKey here
    private let apiKey:String = ""
    
    //Insert baseURL here
    private let baseURL:String = "localhost"
    
    //Insert TenantID here
    private let tenantId:String? = ""
    
    //Insert urlScheme here
    private let urlScheme:String = "https"
    
    //Insert port here
    private let port:Int = 9011
    
    private let client:FusionAuthClient
    
    
    init() {
        let defaultRestClient:DefaultRESTClient = DefaultRESTClient(baseUrl: baseURL, apiKey: apiKey, tenantId: tenantId, urlScheme: urlScheme, port: port)
        
        client = FusionAuthClient(fusionAuth: defaultRestClient)
    }
    
    
    public func GetUserByEmail(emailAddress:String){
        
        var retrieveUserByEmailResponse:ClientResponse<UserResponse> = ClientResponse()
        
        client.RetrieveUserByEmail(email: emailAddress, clientResponse: { (response) in
            retrieveUserByEmailResponse = response
            
            if retrieveUserByEmailResponse.WasSuccessful{
                let user = retrieveUserByEmailResponse.successResponse?.user
                print("\(String(describing: user))")
            }
            
            if response.errorResponse != nil{
                // Error Handling
                let _ = retrieveUserByEmailResponse.errorResponse
            }
            
            if retrieveUserByEmailResponse.exception != nil{
                // Exception Handling
                let _ = retrieveUserByEmailResponse.exception
            }
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
