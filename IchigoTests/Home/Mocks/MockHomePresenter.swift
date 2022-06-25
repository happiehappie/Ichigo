//
//  MockHomePresenter.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

import Foundation
@testable import Ichigo

class MockHomePresenter: HomePresentable {
  
  var presentPhotosWithResponse = false
  var presentPhotosWithError = false
  
  func presentPhotos(with response: HomeModels.PhotosResponse) {
    presentPhotosWithResponse = true
  }
  
  func presentPhotos(with error: HomeModels.DataError) {
    presentPhotosWithError = true
  }
}
