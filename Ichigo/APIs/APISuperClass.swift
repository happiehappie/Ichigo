//
//  APISuperClass.swift
//  Ichigo
//
//  Created by Jack Xiong Lim on 21/6/22.
//

import Foundation

enum HTTPRequestError: Error {
  case unauthorizedAccess
  case invalidURL
  case dataNotFound
}

class APISuperClass {
  
  // MARK: - Properties -
  public static var baseUrl: String {
    return "https://api.unsplash.com/"
  }
  public static var clientId: String {
    return "_-zppMX__uCNaXtst9JLlTtsQ5PMKSQleD2QuNefov8"
  }
}
