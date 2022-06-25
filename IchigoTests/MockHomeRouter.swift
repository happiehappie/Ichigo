//
//  MockHomeRouter.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 24/6/22.
//

import UIKit
@testable import Ichigo

class MockHomeRouter: GeneralRoutable & HomeRoutable {
  var handleError = false
  func navigateBack() {
    
  }
  
  func handleError(error: Error) {
    handleError = true
  }
  
}
