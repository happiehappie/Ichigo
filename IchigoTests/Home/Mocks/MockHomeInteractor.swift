//
//  MockHomeInteractor.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

@testable import Ichigo
import Foundation
import RxSwift

class MockHomeInteractor: HomeBusinessLogic {
  var getPhotosCalled = false
  
  func getPhotos() {
    getPhotosCalled = true
  }
}
