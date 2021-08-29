//
//  JSON Object.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Automatic JSON Encoding & Decoding of Any type that is JSON compatible.
 */
public typealias JSONObject = JSONObjectConverter

public enum JSONObjectConverter:Equatable, Codable {

    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONObject])
    case array([JSONObject])

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let string): try container.encode(string)
        case .int(let int): try container.encode(int)
        case .double(let double): try container.encode(double)
        case .bool(let bool): try container.encode(bool)
        case .object(let object): try container.encode(object)
        case .array(let array): try container.encode(array)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = try ((try? container.decode(String.self)).map(JSONObject.string))
            .or((try? container.decode(Int.self)).map(JSONObject.int))
            .or((try? container.decode(Double.self)).map(JSONObject.double))
            .or((try? container.decode(Bool.self)).map(JSONObject.bool))
            .or((try? container.decode([String: JSONObject].self)).map(JSONObject.object))
            .or((try? container.decode([JSONObject].self)).map(JSONObject.array))
            .resolve(with: DecodingError.typeMismatch(JSONObject.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a valid JSON Type")))
    }
}

extension JSONObject {
    func jsonString(file: StaticString =  #file, line: UInt = #line) -> String {
        do {
            switch self {
            case .string(let string): return string
            case .int(let int): return String(int)
            case .double(let double): return String(double)
            case .bool(let bool): return String(bool)
            case .object, .array: guard let value = try String(data: JSONEncoder().encode(self), encoding: .utf8) else {
                fatalError("Error in test data! String could not be parsed from data", file: file, line: line)
            }
            return value
            }

        } catch {
            fatalError("Error in test data! \(error.localizedDescription)", file: file, line: line)
        }
    }
}

extension JSONObject: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension JSONObject: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .int(value)
    }
}

extension JSONObject: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}

extension JSONObject: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension JSONObject: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: JSONObject...) {
        self = .array(elements)
    }
}

extension JSONObject: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, JSONObject)...) {
        self = .object([String: JSONObject](uniqueKeysWithValues: elements))
    }
}

extension JSONObject {
    func decode<T: Decodable>() throws -> T {
        let encoded = try JSONEncoder().encode(self)
        return try JSONDecoder().decode(T.self, from: encoded)
    }
}

