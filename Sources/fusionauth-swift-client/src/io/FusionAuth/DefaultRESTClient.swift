//
//  DefaultRESTClient.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class DefaultRESTClient{

    private let TENANT_ID_HEADER:String =  "X-FusionAuth-TenantId"
    private(set) var apiKey:String?
    private(set) var baseUrl:String
    private(set) var tenantId:String?
    private(set) var port:Int? = 9011
    private(set) var timeout:Int = 2000
    private(set) var urlScheme:String = "https"
    
    /**
     This sets up the url for the RESTClient.
     */
    
    public init(baseUrl:String, apiKey:String? = nil, tenantId:String? = nil, urlScheme:String = "https", port:Int? = 9011, timeout:Int = 2000){
        self.urlScheme = urlScheme
        self.baseUrl = baseUrl
        self.apiKey = apiKey
        self.tenantId = tenantId
        self.port = port
        self.timeout = timeout
    }


    
    public func RESTClient<T:Codable>(urlPath:String, urlSegments:[String]? = [], httpMethod:HTTPMethod, data:Data? = nil, urlParameters:[URLQueryItem]? = nil, authorization:String? = nil, contentType:ContentType = .applicationJSON, fusionAuthClientResponse: @escaping(ClientResponse<T>) -> ()){

        var clientResponse:ClientResponse<T> = ClientResponse()

        var urlComponents:URLComponents = URLComponents()
        urlComponents.scheme = urlScheme
        urlComponents.host = baseUrl
        urlComponents.path = urlPath
        urlComponents.port = port
        urlComponents.queryItems = urlParameters

        var requestURL:URL = urlComponents.url!

        guard let urlSegments = urlSegments else {return}

        if !urlSegments.isEmpty{
            for segment in urlSegments{
                if segment != ""{
                    requestURL = requestURL.appendingPathComponent(segment)
                }
            }
        }
        


        //Uncomment below to view the requestURL
        debugPrint("debugPrint API URL - " + requestURL.absoluteString)


        let session = URLSession.shared
        let request = NSMutableURLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = TimeInterval(timeout)
        request.setValue((authorization ?? apiKey ?? ""), forHTTPHeaderField: "Authorization")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData


        if tenantId != nil {
            request.setValue(tenantId, forHTTPHeaderField: TENANT_ID_HEADER)
        }

        if data != nil{
            request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        }

        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in

            guard let _:Data = data, let _:URLResponse = response  , error == nil else {

                return
            }
            if let httpResponse = response as? HTTPURLResponse {

                do{
                clientResponse.statusCode = httpResponse.statusCode

                if (httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299){
                    //debugPrint("Success" )
                    //print(data?.prettyPrinted)
                    let jsonDecoder:JSONDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
                    
                    clientResponse.successResponse = try jsonDecoder.decode(T.self, from: data!)
                    //dump(clientResponse)
               }else{
                   debugPrint("HTTPResponse Error \(httpResponse.statusCode)")
                
                    clientResponse.errorResponse = try JSONDecoder().decode(Errors.self, from: data!)
                }

                }
                
                /**
                 WE NEED BETTER ERROR MANAGEMENT HERE
                 */
                catch let JSONError as NSError {
                    //print("\(JSONError)")
                    //debugPrint(data?.prettyPrinted!)
                    //dump(JSONError.code)
                    guard let data = data else{return}
                    if JSONSerialization.isValidJSONObject(data){
                        clientResponse.exception = JSONError
                    }
                        
                }
                fusionAuthClientResponse(clientResponse)

            }
        })
        task.resume()
    }
}

public enum ContentType:String, Codable{
    case applicationJSON = "application/json; charset=utf-8"
    case formURLEncoded = "application/x-www-form-urlencoded"
}
