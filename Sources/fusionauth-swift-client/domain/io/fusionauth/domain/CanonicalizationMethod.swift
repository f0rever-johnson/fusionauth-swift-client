//
//  CanonicalizationMethod.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public enum CanonicalizationMethod:String, Codable {
          case exclusive
          case exclusiveWithComments = "exclusive_with_comments"
          case inclusive
          case inclusiveWithComments = "inclusive_with_comments"
}
