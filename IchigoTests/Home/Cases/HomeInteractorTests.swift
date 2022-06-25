//
//  HomeInteractorTests.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

import XCTest
@testable import Ichigo

class HomeInteractorTests: XCTestCase {
  var sut: HomeInteractor!
  var mockPresenter: MockHomePresenter!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
    mockPresenter = MockHomePresenter()
    sut = HomeInteractor(presenter: mockPresenter)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    mockPresenter = nil
    try super.tearDownWithError()
  }
  
  func testHome_whenPhotosReturnsResult() {
    // Given
    MockGetPhotosEvent.type = .someObject
    sut.getPhotosEventType = MockGetPhotosEvent.self
    
    // When
    let exp = expectation(for: NSPredicate(block: { (presenter, _) -> Bool in
      return (presenter as! MockHomePresenter).presentPhotosWithResponse
    }), evaluatedWith: mockPresenter, handler: nil)
    sut.getPhotos()
    
    // Then
    wait(for: [exp], timeout: 2.0)
    XCTAssertTrue(mockPresenter.presentPhotosWithResponse)
    
  }
  
  func testHome_whenPhotosReturnsError() {
    // Given
    MockGetPhotosEvent.type = .error
    sut.getPhotosEventType = MockGetPhotosEvent.self
    
    // When
    let exp = expectation(for: NSPredicate(block: { (presenter, _) -> Bool in
      return (presenter as! MockHomePresenter).presentPhotosWithError
    }), evaluatedWith: mockPresenter, handler: nil)
    sut.getPhotos()
    
    // Then
    wait(for: [exp], timeout: 2.0)
    XCTAssertTrue(mockPresenter.presentPhotosWithError)
  }
}

