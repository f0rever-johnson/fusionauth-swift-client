//
//  CanonicalizationMethod.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum CanonicalizationMethod:String, Codable {
          case exclusive = "exclusive"
          case exclusive_with_comments = "exclusive_with_comments"
          case inclusive = "inclusive"
          case inclusive_with_comments = "inclusive_with_comments"
}
