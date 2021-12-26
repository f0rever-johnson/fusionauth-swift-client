//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Standard error domain object that can also be used as the response from an API call.
 */

public struct Errors: Codable{
    public var fieldErrors: fieldError?
    public var generalErrors: [generalError]?


    public struct fieldError: Codable {

        public var errorName: [String: [errorDescription]]

        public struct errorDescription: Codable {
            public let message: String
            public let code: String
        }

        private struct CustomCodingKeys: CodingKey {
            var stringValue: String
            init?(stringValue: String) {
                self.stringValue = stringValue
            }
            var intValue: Int?
            init?(intValue: Int) {
                return nil
            }
        }
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CustomCodingKeys.self)

            self.errorName = [String: [errorDescription]]()
            for key in container.allKeys {
                let value = try container.decode([errorDescription].self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
                self.errorName[key.stringValue] = value
            }
        }
    }

    public struct generalError: Codable {
        public let code:String
        public let message:String
    }



    public func Empty() -> Bool{
        return fieldErrors == nil && generalErrors == nil
    }

    /**
     * Return the total count of all errors. All field errors and general errors
     */

    public func Size() -> Int{
        return (generalErrors?.count ?? 0) + (fieldErrors?.errorName.count ?? 0)
    }

    public func ToString() -> String{
        let json = try! JSONEncoder().encode(self)
        return String(bytes: json, encoding: String.Encoding.utf8)!
    }
}
