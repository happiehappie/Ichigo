//
//  HomePresenterTests.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

import XCTest
@testable import Ichigo

class HomePresenterTests: XCTestCase {
  var sut: HomePresenter!
  var mockViewModel: MockHomeViewModel!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
    mockViewModel = MockHomeViewModel()
    sut = HomePresenter(viewController: mockViewModel)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    mockViewModel = nil
    try super.tearDownWithError()
  }
  
  func testPresentPhotos_whenReturnsResult() {
    // Given
    let exp = expectation(for: NSPredicate(block: { (mockViewModel, _) -> Bool in
      return (mockViewModel as! MockHomeViewModel).displayPhotosWithViewModel
    }), evaluatedWith: mockViewModel, handler: nil)
    
    // When
    sut.presentPhotos(with: HomeModels.PhotosResponse(response: GetPhotosResponse.mock()))
    
    // Then
    wait(for: [exp], timeout: 2.0)
    XCTAssertTrue(mockViewModel.displayPhotosWithViewModel)
  }
  
  func testPresentPhotos_whenReturnsError() {
    // Given
    let exp = expectation(for: NSPredicate(block: { (mockViewModel, _) -> Bool in
      return (mockViewModel as! MockHomeViewModel).displayPhotosWithError
    }), evaluatedWith: mockViewModel, handler: nil)
    
    // When
    sut.presentPhotos(with: HomeModels.DataError(error: MockGetPhotosEventError.http))
    
    // Then
    wait(for: [exp], timeout: 2.0)
    XCTAssertTrue(mockViewModel.displayPhotosWithError)
  }
  
}

