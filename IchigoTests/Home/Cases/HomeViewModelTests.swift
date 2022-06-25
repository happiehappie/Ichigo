//
//  HomeViewModelTests.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

import XCTest
@testable import Ichigo
import RxSwift

class HomeViewModelTests: XCTestCase {
  var sut: HomeViewModel!
  var viewController: HomeViewController<HomeViewModel, MockHomeRouter>!
  var mockInteractor: MockHomeInteractor!
  var mockRouter: MockHomeRouter!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
    sut = HomeViewModel()
    mockInteractor = MockHomeInteractor()
    sut.interactor = mockInteractor
    loadViewController()
  }
  
  private func loadViewController() {
    mockRouter = MockHomeRouter()
    viewController = HomeViewController(viewModel: sut, router: mockRouter)
    viewController.loadViewIfNeeded()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    viewController = nil
    mockInteractor = nil
    mockRouter = nil
    try super.tearDownWithError()
  }
  
  func testHome_whenDisplayPhotosWithResponse_getCalled() {
    // When
    sut.displayPhotos(with: HomeModels.PhotosViewModel.mock())
    
    // Then
    XCTAssertNotNil(sut.photos.value)
  }
  
  func testNotifyError_whenDisplayPhotosWithError_getCalled() {
    // Given
    let exp = givenViewIsLoadedAndNotifyErrorExpectation()
    
    // When
    sut.displayPhotos(with: HomeModels.DataError(error: MockGetPhotosEventError.http))
    
    // Then
    wait(for: [exp], timeout: 2.0)
  }
  
  private func givenViewIsLoadedAndNotifyErrorExpectation() -> XCTestExpectation {
    return expectation(for: NSPredicate(block: { (mockRouter, _) -> Bool in
      return (mockRouter as! MockHomeRouter).handleError
    }), evaluatedWith: mockRouter, handler: nil)
  }
  
}

