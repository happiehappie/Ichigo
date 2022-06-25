//
//  MockHomeViewModel.swift
//  IchigoTests
//
//  Created by Jack Xiong Lim on 25/6/22.
//

import Foundation
@testable import Ichigo
import RxCocoa
import RxDataSources

class MockHomeViewModel: HomeViewModelType {
  
  var photos: BehaviorRelay<[PhotoWithInfoTableViewCellViewModel]> = BehaviorRelay(value: [])
  var notifyError: PublishRelay<Error?> = PublishRelay()
  
  var sectionedItems: BehaviorRelay<[HomeSection]> = BehaviorRelay(value: [])
  
  var sectionCache: [Int : HomeSection] = [Int: HomeSection]()
  
  var dataSource: RxTableViewSectionedReloadDataSource<HomeSection> = Section.generateDataSource()
  
  var displayPhotosWithViewModel = false
  var displayPhotosWithError = false
  
  required init() {}
}

extension MockHomeViewModel: HomeDisplayable {
  func displayPhotos(with viewModel: HomeModels.PhotosViewModel) {
    displayPhotosWithViewModel = true
  }
  
  func displayPhotos(with error: HomeModels.DataError) {
    displayPhotosWithError = true
  }
}
